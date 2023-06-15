#include <ros/ros.h>
#include <sensor_msgs/Joy>
#include <four_motor_ctrl/motorinfo>


ros::Publisher cmd_pub;
four_motor_ctrl::motorinfo ctrl_cmd;
void jotcallback(sensor_msgs::Joy joy)
{
    
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "joy_ctrl");
    ros::NodeHandle nh("~");
    ros::Subscriber joy_sub;
    
    joy_sub = nh.subscribe("/joy", 1, &jotcallback, this);
    cmd_pub = nh.advertise<four_motor_ctrl::motorinfo>("/cmd_man", 10);

    ctrl_cmd.mode = 10;
    
    ros::Rate r(1);
    while(ros::ok())
    {

        r.sleep();
    }
}