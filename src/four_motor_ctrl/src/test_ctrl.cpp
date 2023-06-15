#include <four_motor_ctrl.h>
#include<math.h>
#include<chrono>
#include<iostream>
using namespace std;
#define PI 3.1415926
// Set the serial port name
// SerialPort serial0("/dev/ttyUSB0");
float one_spin =2*PI;
double pos_arm,pos_joy;
bool modeB=0;
bool modeA=0;
double vel_joy,turn_joy;
double joy0;
// double pos1;
// double pos0;
// double pos_0,pos_1,pos_track0,pos_track1,track_err,pos_state;
// double pos_err=0;
// double pos0_fmod;
// double pos1_fmod;
void motorCtrl::init(ros::NodeHandle &nh, int mid, int sid_) //serial0
{
    nh_ = nh;
    // Initialized parameter
    motor_s.motorType = MotorType::A1Go1;
    motor_s.mode = 0;
    motor_s.W = 0.0;
    motor_s.T = 0.0;
    motor_s.Pos = 0.0;
    motor_s.K_P = 0.0;
    motor_s.K_W = 0.0;
    motor_s.id = mid;
    sid = sid_;
//this->serial=SerialPort("/dev/ttyUSB" + to_string(sid));
    infoPub = nh.advertise<four_motor_ctrl::motorinfo>("/m"+to_string(mid)+"info", 10);
}
void motorCtrl::pubInfo(four_motor_ctrl::motorinfo info)
{
    infoPub.publish(info);
}
void motorCtrl::move(double vel=0,double T=0,double Pos=0,double Kp=0,double Kw=0)
{ 
    SerialPort serial("/dev/ttyUSB"+to_string(sid));
    motor_s.motorType = MotorType::A1Go1;
    motor_s.mode = 10;
    motor_s.W = vel;
    motor_s.T = T;
    motor_s.Pos =Pos;
    motor_s.K_P = Kp;
    motor_s.K_W = Kw;
    serial.sendRecv(&motor_s, &motor_r);//make the motor stop
}
void motorCtrl::stop()//定义电机模式为0，即为停止
{
    SerialPort serial("/dev/ttyUSB"+to_string(sid));
    motor_s.motorType = MotorType::A1Go1;
    motor_s.mode = 0;
    serial.sendRecv(&motor_s, &motor_r);//make the motor stop
}
void motorsetCtrl::init(ros::NodeHandle &nh,auto s_port) //serial0
{
    motor0.init(nh,0,s_port);// Initialized parameter and set id（初始化参数）
    motor1.init(nh,1,s_port);
    allStop();
    pos0=motor0.motor_r.Pos;
    pos1=motor1.motor_r.Pos;
    cout<<"init_motor0_Pos:"<<pos0<<endl;
    cout<<"init_motor1_Pos:"<<pos1<<endl;
    pos0_fmod=fmod(pos0,2*PI);
    pos1_fmod=fmod(pos1,2*PI);
    cout<<"pos0_fmod:"<<pos0_fmod<<endl;
    cout<<"pos1_fmod:"<<pos1_fmod<<endl;
    if(pos1<0)
    {  
        dif_pos = pos0_fmod+pos1_fmod; 
    }
    else if (pos1>=0)
    {
        dif_pos = pos0_fmod-pos1_fmod; 
    }
    cout<<"初始位置误差:"<<dif_pos<<endl;

    joySub = nh.subscribe<sensor_msgs::Joy>("/joy", 10, &motorsetCtrl::joyHandler, this);
    max_vel = 5*9.1;//最大速度
    max_pos = 0.0025*3.14*9.1;//最大摆臂位置增量
}
void motorsetCtrl::joyHandler(const sensor_msgs::JoyConstPtr& msgIn)
{
    if(motor0.sid==1)//这里保证模式切换只有一个对象执行
    {
    
        if(msgIn->buttons[1]==1) modeB=!modeB;//模式切换按键为“B”（红色）
        if(msgIn->buttons[0]==1) modeA=!modeA;   

    }
    //手柄第一轴定义，0.3为手柄死区，过小容易抖动
    if (msgIn->axes[0]>0.3)
    {  
        turn_joy=-msgIn->axes[0]*0.8*max_vel;

    }
    else if(msgIn->axes[0]<-0.3)
    {
        turn_joy=-msgIn->axes[0]*0.8*max_vel;

    }
    else if(msgIn->axes[0]>-0.3||msgIn->axes[0]<0.3)
    {
        turn_joy=0;
    }
    //手柄第二轴定义，0.3为手柄死区，过小容易抖动
    if (msgIn->axes[1]>0.3)
    {  
        vel_joy=-msgIn->axes[1]*max_vel;

    }
    else if(msgIn->axes[1]<-0.3)
    {
        vel_joy=-msgIn->axes[1]*max_vel;

    }
    else if(msgIn->axes[1]>-0.3||msgIn->axes[1]<0.3)
    {
        vel_joy=0;
    }

    
    //手柄第四轴定义,0.25为手柄死区，过小容易抖动
    if (msgIn->axes[4]>0.25)
    {     
        pos_joy=-msgIn->axes[4]*max_pos;

    }
    else if(msgIn->axes[4]<-0.25)
    {

        pos_joy=-msgIn->axes[4]*max_pos;
    }
    else if(msgIn->axes[4]>-0.25||msgIn->axes[4]<0.25)
    {
        pos_joy=0;
    }

    #if 0 //是否使能在速度控制模式下摆臂
    if(mode==0)
    {
        pos_joy=0;
    }
    #endif
}
void motorsetCtrl::allMove(double vel)
{
    float dif_pos_now = -motor0.motor_r.Pos-motor1.motor_r.Pos;
    float P = 1;
    if ((dif_pos-dif_pos_now) >20)
    {
        dif_pos_now = dif_pos;
    }
    motor0.move((vel)-P*(dif_pos-dif_pos_now),0,0,0,0);
    motor1.move((vel)-P*(dif_pos-dif_pos_now),0,0,0,0);
    // motor0.move(-vel);
    // motor1.move(vel);
}
void motorsetCtrl::sinMove(double vel, double pos,bool mode,auto dir)
{ 
    pos_0=motor0.motor_r.Pos;//获取0号电机的位置
    pos_1=motor1.motor_r.Pos;//获取0号电机的位置
    if(dir==0)
    {
        if(mode==vel_control)//速度控制 
        {
            motor0.move(vel,0,0,0,3);
        }
        else//位置控制 
        {
            motor0.move(0,0,pos_0,0.2,12);
        }
    }
    else if(dir==1)
    {
        if(mode==vel_control)//速度控制 
        {
            motor0.move(-vel,0,0,0,3);
        }
        else//位置控制 
        {
            motor0.move(0,0,pos_0,0.2,12);
        }
    }


}

void motorsetCtrl::pos_synchronous(double vel_1,double pos,bool mode,auto dir)
{
    pos_0=motor0.motor_r.Pos;//获取0号电机的位置
    pos_1=motor1.motor_r.Pos;//获取1号电机的位置
    // cout<<"motor0_Pos:"<<pos_0<<endl;
    // cout<<"motor1_Pos:"<<pos_1<<endl;

    if(pos_1>=0)
    {
        pos_err=pos_0-pos_1;

    }
    else
    {
        pos_err=pos_0+pos_1;

    }
    // cout<<"初始位置误差:"<<dif_pos<<endl;
    // cout<<"当前位置误差:"<<pos_err<<endl; 
    // pos_track1=pos_0-dif_pos+pos;//使用0号电机的位置减去初始位置，保持电机之间的位置差

    if(dir==0)
    {

        pos_track1=-1*(pos_0-dif_pos)+2*pos1_fmod+pos; 
        // cout<<"pos0:      "<<pos0<<endl; 
        // cout<<"pos1:      "<<pos1<<endl;      
        // cout<<"pos0_fmod:"<<pos0_fmod<<endl;
        // cout<<"pos1_fmod:"<<pos1_fmod<<endl;    
        // cout<<"pos_track1:"<<pos_track1<<endl; 
        if(mode==vel_control)
        {
            if(pos_0<=-1590||1590<=pos_0)//给电机1小段的驱动速度使  他自主的越过突变（突变1604）
            {
                motor1.move(-vel_1,0,0,0,3);
            }
            else if(-1590<pos_0&&pos_0<1590)//当motor0的位置处于（-1590，1590）时使用位置控制
            {

                motor1.move(0,0,pos_track1,0.02,0.3);//将pos_0作为控制量去控制电机1
            }

        }
        else
        {
            

            motor1.move(0,0,pos_track1,0.05,6);//将pos_0作为控制量去控制电机1  
        }

    }
    else if(dir==1)
    {
        pos_track1=-1*(pos_0-dif_pos)+2*pos1-pos;  
        if(mode==vel_control)
        {
            if(pos_0<=-1590||1590<=pos_0)//给电机1小段的驱动速度使  他自主的越过突变（突变1604）
            {
                motor1.move(vel_1,0,0,0,3);
            }
            else if(-1590<pos_0&&pos_0<1590)//当motor0的位置处于（-1590，1590）时使用位置控制
            {

                motor1.move(0,0,pos_track1,0.02,0.3);//将pos_0作为控制量去控制电机1
            }

        }

        else
        {

            motor1.move(0,0,pos_track1,0.05,6);//将pos_0作为控制量去控制电机1  
        }
    }
    
}


void motorsetCtrl::allStop()
{
    motor0.stop();
    motor1.stop();
}

double motorsetCtrl::PID_controller(auto target,auto current,auto KP,auto KI,auto KD)
{
    err = target-current;
    pid_out = KD*err+KI*sum_err+KD*(err-last_err);
    sum_err += err;
    last_err = err;
    return pid_out;
}

void motorsetCtrl::showInfo()
{
    // // cout<<"**************电机0*****************"<<endl;
    // // cout<<"力矩"<<motor0.motor_r.T<<endl;
    // // cout<<"速度（高速）"<<motor0.motor_r.W<<endl;
    // // cout<<"速度（低速）"<<motor0.motor_r.LW<<endl;
    // // cout<<"加速度"<<motor0.motor_r.Acc<<endl;
    // cout<<"电机0位置"<<motor0.motor_r.Pos<<endl;
    // // cout<<"**************电机1*****************"<<endl;
    // // cout<<"力矩"<<motor1.motor_r.T<<endl;
    // // cout<<"速度（高速）"<<motor1.motor_r.W<<endl;
    // // cout<<"速度（低速）"<<motor1.motor_r.LW<<endl;
    // // cout<<"加速度"<<motor1.motor_r.Acc<<endl;
    // cout<<"电机1位置"<<motor1.motor_r.Pos<<endl;
    // // cout<<"**************end****************"<<endl;


    // cout<<"pos0:"<<pos0<<endl;
    // cout<<"pos1:"<<pos1<<endl;
    // cout<<"初始位置差:"<<dif_pos<<endl;
    // // cout<<"当前位置差"<<motor0.motor_r.Pos+motor1.motor_r.Pos<<endl;
    // cout<<"当前位置差"<<pos_err<<endl;
    // // cout<<"vel_joy:    "<<vel_joy<<endl;
    // // cout<<"pos_joy:    "<<pos_joy<<endl;
 

    four_motor_ctrl::motorinfo m0info,m1info;
    m0info.T = motor0.motor_r.T;
    m0info.W = motor0.motor_r.W;
    m0info.LW = motor0.motor_r.LW;
    m0info.Acc = motor0.motor_r.Acc;
    m0info.Pos = motor0.motor_r.Pos;
    motor0.pubInfo(m0info);

    m1info.T = motor1.motor_r.T;
    m1info.W = motor1.motor_r.W;
    m1info.LW = motor1.motor_r.LW;
    m1info.Acc = motor1.motor_r.Acc;
    m1info.Pos = motor1.motor_r.Pos;
    m1info.pos_joy1 = pos_arm;
    motor1.pubInfo(m1info);
}

void crawler_front(motorsetCtrl &ms0,motorsetCtrl &ms1)
{
    // cout<<"turn_joy:"<<turn_joy<<endl; 
    // cout<<"vel_joy:"<<vel_joy<<endl; 
    // cout<<"-vel_joy-turn_joy:"<<-vel_joy-turn_joy<<endl; 
    // cout<<"-vel_joy+turn_joy:"<<-vel_joy+turn_joy<<endl; 
    ms0.sinMove(-vel_joy-turn_joy,pos_joy,modeB,0);
    ms0.pos_synchronous(-vel_joy-turn_joy,pos_arm,modeB,0);

    ms1.sinMove(-vel_joy+turn_joy,pos_joy,modeB,1);
    ms1.pos_synchronous(-vel_joy+turn_joy,pos_arm,modeB,1);
    // ms1.showInfo();
    // ms0.showInfo();

}


void crawler_turn(motorsetCtrl &ms0,motorsetCtrl &ms1)
{
    ms0.sinMove(-vel_joy,pos_joy,modeB,1);
    ms0.pos_synchronous(-vel_joy,pos_arm,modeB,1);

    ms1.sinMove(-vel_joy,pos_joy,modeB,1);
    ms1.pos_synchronous(-vel_joy,pos_arm,modeB,1);

}



int main(int argc, char *argv[])
{
    ros::init(argc, argv, "motor_ctrl");
    ros::NodeHandle nh("~");
    motorsetCtrl ms_ctrl0;
    motorsetCtrl ms_ctrl1;
    ms_ctrl0.init(nh,0);
    
    ms_ctrl1.init(nh,1);

    ros::Rate r(1000);



    while(ros::ok())
    {  
        pos_arm+=pos_joy;
        
        crawler_front(ms_ctrl0,ms_ctrl1);
        ros::spinOnce();
        r.sleep();
    }
    ms_ctrl0.allStop();                                                                               
    return 0;
}



// test fmod
    // double x1=23.85;
    // double x2=-14.83;
    // double out1 = fmod(x1,2*PI);  
    // double out2 = fmod(x2,2*PI); 
    // cout<<out1<<endl;
    // cout<<out2<<endl;
    // cout<<out1-out2<<endl;


//test running time
//     auto start_time = std::chrono::high_resolution_clock::now();
//     // 在这里放置你的代码
//     auto end_time = std::chrono::high_resolution_clock::now();
//     auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time);
//     std::cout << "程序执行时间为：" << duration.count() << " 微秒" << std::endl;

// ros::AsyncSpinner spinner(2);//双线程？
// spinner.start();
// ros::waitForShutdown();