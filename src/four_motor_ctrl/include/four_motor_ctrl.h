#ifndef _MOTOR_CTRL_H
#define _MOTOR_CTRL_H

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"
#include "basic_ctrl/swing.h"
#include "four_motor_ctrl/motorinfo.h"
#include "string.h"
#include "serialPort/SerialPort.h"
#include "csignal"
#include <sensor_msgs/Joy.h>

#define PI 3.1415926
#define vel_control 0
#define pos_control 1

using namespace std;

class motorCtrl
{
// control a motor
private:
    ros::NodeHandle nh_;

    /* Publisher */
    // motor information publisher
    ros::Publisher infoPub;
    //SerialPort serial;
  

public:
	motorCtrl(){};
	~motorCtrl(){};
  int sid;
    // Send message struct
    MOTOR_send motor_s;
    // Receive message struct
    MOTOR_recv motor_r;
    
	void init(ros::NodeHandle &nh, int mid, int sid);
    void pubInfo(four_motor_ctrl::motorinfo info);
    void move(double vel,double T,double Pos,double Kp,double Kw);
    void stop();


};
class motorsetCtrl
{
// control motors(two in this project) with a serial port
private:
	/*---------- Parameters ----------*/
    string remoteTopic = "/cmd_man";//same topic name

    // Motor Parameters
    // int motor_speed = 0;

    double wheelDist = 0.2912;
    
    double dif_pos0 ;
    double dif_pos1 ;
    double temp0;
    double temp1;

    double max_vel;
    double max_pos;

    double KP,KI,KD;
    double err,last_err,sum_err,pid_out;

    float cube_speed;
    float cube_angular;
    float swing_F;
    float swing_B;


    string motor_state0 = "0_0";
    string motor_state1 = "1_0";

    double diff = 1.0;//两个电机的补偿

    // Send message struct
    MOTOR_send motor_run0, motor_stop0, motor_run1, motor_stop1;

    // Receive message struct
    MOTOR_recv motor_r0, motor_r1;


	/*---------- Function ----------*/
	/* Publisher */
    ros::Publisher m0infoPub;
    ros::Publisher m1infoPub;
	/* Subscriber */
    ros::Subscriber ctrlSub;

	/* Server */

	/* Timer */
    ros::Timer ctrlUpdate;

	/* ROS function */
    void ctrlHandler(const basic_ctrl::swingConstPtr& msgIn);
    void ctrlUpdateHandler(const ros::TimerEvent& event);



	/* Other function */

	/* Debug function */


    ros::Subscriber joySub;

public:
    motorCtrl motor0,motor1;
    double dif_pos;


    double pos1;
    double pos0;
    double pos_0,pos_1,pos_track0,pos_track1,track_err,pos_state;
    double pos_err=0;
    double pos0_fmod;
    double pos1_fmod;


	motorsetCtrl(){};
	~motorsetCtrl(){};
    void joyHandler(const sensor_msgs::JoyConstPtr& msgIn);
    void pos_synchronous(double vel_1,double pos,bool mode,auto dir);
	void init(ros::NodeHandle &nh,auto s_port); 
    void allMove(double vel);
    void sinMove(double vel, double pos,bool mode,auto dir);
    double PID_controller(auto target, auto current, auto KP,auto KI,auto KD);
    void allStop();
    void showInfo();
};



#endif