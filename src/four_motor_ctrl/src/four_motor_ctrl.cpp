#include <four_motor_ctrl.h>

using namespace std;

// Set the serial port name
SerialPort serial0("/dev/ttyUSB0");
SerialPort serial1("/dev/ttyUSB1");

void motorCtrl0::init(ros::NodeHandle &nh) //serial0
{
    // Initialized parameter（初始化参数）

    // Set the id of motor
    motor_run0.id = 0;
    motor_run1.id = 1;
    temp0 = motor_r0.Pos;                                                                                                                                                                                                                                                                                      


    // Set the motor type, A1Go1 or B1 id0 0-0
    motor_run0.motorType = MotorType::A1Go1;
    motor_run0.mode = 10;
    motor_run0.W = 0.0;
    motor_run0.T = 0.0;
    motor_run0.Pos = 0.0;
    motor_run0.K_P = 0.0;
    motor_run0.K_W = 1.0;

    motor_stop0.id = motor_run0.id;
    motor_stop0.motorType = motor_run0.motorType;
    motor_stop0.mode = 0;

    motor_r0.motorType = motor_run0.motorType;

     // Set the motor type, A1Go1 or B1 id1 0-1
    motor_run1.motorType = MotorType::A1Go1;
    motor_run1.mode = 10;
    motor_run1.W = 0.0;
    motor_run1.T = 0.0;
    motor_run1.Pos = 0.0;
    motor_run1.K_P = 0.0;
    motor_run1.K_W = 3.0;

    motor_stop1.id = motor_run1.id;
    motor_stop1.motorType = motor_run1.motorType;
    motor_stop1.mode = 0;

    motor_r1.motorType = motor_run1.motorType;
    
    // Publisher and subscriber
    ctrlSub = nh.subscribe<basic_ctrl::swing>(ctrlTopic, 10, &motorCtrl0::ctrlHandler, this);

    // Timer
    ctrlUpdate = nh.createTimer(ros::Duration(0.01), &motorCtrl0::ctrlUpdateHandler, this);
}


void motorCtrl1::init(ros::NodeHandle &nh) //serial1
{
    // Initialized parameter（初始化参数）

    // Set the id of motor
    motor_run0.id = 0;
    motor_run1.id = 1;
    temp0 = motor_r0.Pos;


    // Set the motor type, A1Go1 or B1 id0
    motor_run0.motorType = MotorType::A1Go1;
    motor_run0.mode = 10;
    motor_run0.W = 0.0;
    motor_run0.T = 0.0;
    motor_run0.Pos = 0.0;
    motor_run0.K_P = 0.0;
    motor_run0.K_W = 3.0;

    motor_stop0.id = motor_run0.id;
    motor_stop0.motorType = motor_run0.motorType;
    motor_stop0.mode = 0;

    motor_r0.motorType = motor_run0.motorType;

     // Set the motor type, A1Go1 or B1 id1
    motor_run1.motorType = MotorType::A1Go1;
    motor_run1.mode = 10;
    motor_run1.W = 0.0;
    motor_run1.T = 0.0;
    motor_run1.Pos = 0.0;
    motor_run1.K_P = 0.0;
    motor_run1.K_W = 3.0;

    motor_stop1.id = motor_run1.id;
    motor_stop1.motorType = motor_run1.motorType;
    motor_stop1.mode = 0;

    motor_r1.motorType = motor_run1.motorType;
    
    // Publisher and subscriber
    ctrlSub = nh.subscribe<basic_ctrl::swing>(ctrlTopic, 10, &motorCtrl1::ctrlHandler, this);

    // Timer
    ctrlUpdate = nh.createTimer(ros::Duration(0.01), &motorCtrl1::ctrlUpdateHandler, this);
}

void motorCtrl0::ctrlHandler(const basic_ctrl::swingConstPtr &msgIn)//serial0
{
    cube_speed = msgIn->speed;
    cube_angular = msgIn->angular;
    swing_F = msgIn->underarmF;
    swing_B = msgIn->underarmB;
}

void motorCtrl0::ctrlUpdateHandler(const ros::TimerEvent& event)//serial0
{
    // if (cube_speed != 0 && cube_angular == 0)
    // {
    //     motor_run0.W = cube_speed * 3 * 9.1 ;
    //     motor_run1.W = cube_speed * 3 * 9.1 ;//* ((diff-1)*0.5+1.03);//9.1减速比，1.049补偿系数    
    // }
    // else if (cube_speed == 0 && cube_angular != 0)
    // {
    //     motor_run0.W = cube_angular * -3 * 9.1 ;
    //     motor_run1.W = cube_angular * -3 * 9.1 ;
    // }
    // else if (cube_speed != 0 && cube_angular != 0)
    // {
    //     motor_run0.W = (cube_speed - cube_angular) * 3 * 9.1 ;
    //     motor_run1.W = (cube_speed - cube_angular) * 3 * 9.1 ;
    // }

    // if (abs(cube_speed) <= 0.001 && abs(cube_angular) <= 0.001)
    // {
    //     serial0.sendRecv(&motor_stop0, &motor_r0);//make the motor stop
    //     serial0.sendRecv(&motor_stop1, &motor_r1);
    // }
    // else
    // {
    //     serial0.sendRecv(&motor_run0, &motor_r0);
    //     extract_data(&motor_r0);
    //     serial0.sendRecv(&motor_run1, &motor_r1);
    //     extract_data(&motor_r1);
    // }

    if (abs(cube_speed) <= 0.0001 && abs(cube_angular) <= 0.0001 && abs(swing_F) <= 0.0001 && abs(swing_B) <= 0.0001)
    {
        serial0.sendRecv(&motor_stop0, &motor_r0);//make the motor stop
        serial0.sendRecv(&motor_stop1, &motor_r1);
    }
    else
    {
        motor_run0.W = cube_speed - cube_angular * wheelDist / 2;
        motor_run1.W = cube_speed - cube_angular * wheelDist / 2;//prevent cube = swing_B
        if (swing_F != 0 && swing_B == 0)
        {
            if (abs(cube_speed) == swing_F) //temp
                motor_run0.W += swing_F * 1.5;
            else
                motor_run0.W += swing_F;

        }
        
        if (swing_B != 0 && swing_F == 0)
        {

            if (abs(cube_speed) == swing_B) //temp
                motor_run0.W -= swing_B * 1.5;
            else
                motor_run0.W -= swing_B;

        }

        motor_run0.W = motor_run0.W * -3 * 9.1;  //0-0 motor max rotate speed 21 rad/s.
        motor_run1.W = motor_run1.W * 3 * 9.1;  //0-1
        serial0.sendRecv(&motor_run0, &motor_r0);
        extract_data(&motor_r0);
        serial0.sendRecv(&motor_run1, &motor_r1);
        extract_data(&motor_r1);
    }
}


void motorCtrl1::ctrlHandler(const basic_ctrl::swingConstPtr &msgIn)//serial1
{
    cube_speed = msgIn->speed;
    cube_angular = msgIn->angular;
    swing_F = msgIn->underarmF;
    swing_B = msgIn->underarmB;
}


void motorCtrl1::ctrlUpdateHandler(const ros::TimerEvent& event)//serial1
{
    // if (cube_speed != 0 && cube_angular == 0)
    // {
    //     motor_run0.W = cube_speed * 3 * 9.1 ;
    //     motor_run1.W = cube_speed * 3 * 9.1 ;//* ((diff-1)*0.5+1.03);//9.1减速比，1.049补偿系数    
    // }
    // else if (cube_speed == 0 && cube_angular != 0)
    // {
    //     motor_run0.W = cube_angular * 3 * 9.1 ;
    //     motor_run1.W = cube_angular * 3 * 9.1 ;
    // }
    // else if (cube_speed != 0 && cube_angular != 0)
    // {
    //     motor_run0.W = (cube_speed + cube_angular) * 3 * 9.1 ;
    //     motor_run1.W = (cube_speed + cube_angular) * 3 * 9.1 ;
    // }

    // if (abs(cube_speed) <= 0.001 && abs(cube_angular) <= 0.001)
    // {
    //     serial1.sendRecv(&motor_stop0, &motor_r0);//make the motor stop
    //     serial1.sendRecv(&motor_stop1, &motor_r1);
    // }
    // else
    // {
    //     serial1.sendRecv(&motor_run0, &motor_r0);
    //     extract_data(&motor_r0);
    //     serial1.sendRecv(&motor_run1, &motor_r1);
    //     extract_data(&motor_r1);
    // }
        
    if (abs(cube_speed) <= 0.0001 && abs(cube_angular) <= 0.0001 && abs(swing_F) <= 0.0001 && abs(swing_B) <= 0.0001)
    {
        serial1.sendRecv(&motor_stop0, &motor_r0);//make the motor stop
        serial1.sendRecv(&motor_stop1, &motor_r1);
    }
    else
    {
        motor_run0.W = cube_speed + cube_angular * wheelDist / 2;
        motor_run1.W = cube_speed + cube_angular * wheelDist / 2;
       if (swing_F != 0 && swing_B == 0)
        {
            if (abs(cube_speed) == swing_F) //temp
                motor_run0.W += swing_F * 1.5;
            else
                motor_run0.W += swing_F;

        }
        
        if (swing_B != 0 && swing_F == 0)
        {

            if (abs(cube_speed) == swing_B) //temp
                motor_run0.W -= swing_B * 1.5;
            else
                motor_run0.W -= swing_B;

        }

        motor_run0.W = motor_run0.W * 3 * 9.1;   //1-0      
        motor_run1.W = motor_run1.W * -3 * 9.1;   //1-1
        serial1.sendRecv(&motor_run0, &motor_r0);
        extract_data(&motor_r0);
        serial1.sendRecv(&motor_run1, &motor_r1);
        extract_data(&motor_r1);
    }
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "motor_ctrl");
    ros::NodeHandle nh("~");

    motorCtrl0 motor_ctrl0;
    motor_ctrl0.init(nh);

    motorCtrl1 motor_ctrl1;
    motor_ctrl1.init(nh);

    ros::AsyncSpinner spinner(2);//双线程？

    spinner.start();

    ros::waitForShutdown();

    return 0;
}