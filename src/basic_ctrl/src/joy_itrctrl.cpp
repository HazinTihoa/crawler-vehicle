#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/TwistStamped.h>
#include "basic_ctrl/swing.h"

#define MANUAL_MODE 0
#define AUTO_MODE 1

class JoystickControl
{
private:
  int mode = MANUAL_MODE;
  float update_cmd_rate;

  // The car parameters
  float speed, angular, swing_F, swing_B;
  float max_speed, max_angular;

  // Joystick parameters
  int joy_speed_axis, joy_angular_axis, joy_manual_button, joy_auto_button;
  float joy_max_speed, joy_max_angular, joy_underarm_F, joy_underarm_B;

  // A ROS node
  ros::NodeHandle nh;

  // A timer to update the pose
  ros::Timer update_pose_timer;

  // Listen for drive and joystick commands
  ros::Publisher cmd_pub;
  ros::Subscriber joy_sub;
  ros::Subscriber auto_sub;

public:
  JoystickControl()
  {
    // Initialize the node handle
    nh = ros::NodeHandle("~");

    // Get joystick parameters
    bool joy;
    nh.getParam("joy", joy);
    nh.getParam("joy_max_speed", joy_max_speed);
    nh.getParam("joy_max_angular", joy_max_angular);
    nh.getParam("joy_speed_axis", joy_speed_axis);
    nh.getParam("joy_angular_axis", joy_angular_axis);
    nh.getParam("joy_auto_button", joy_auto_button);
    nh.getParam("joy_manual_button", joy_manual_button);
    nh.getParam("joy_underarm_F", joy_underarm_F);
    nh.getParam("joy_underarm_B", joy_underarm_B);

    nh.getParam("update_pose_rate", update_cmd_rate);

    // Get the car parameters
    nh.getParam("max_speed", max_speed);
    nh.getParam("max_angular", max_angular);

    // Start a timer to output the pose
    update_pose_timer = nh.createTimer(ros::Duration(update_cmd_rate), &JoystickControl::update_cmd, this);

    // If the joystick is enabled
    if (joy)
      // Start a subscriber to listen to joystick commands
      joy_sub = nh.subscribe("/joy", 1, &JoystickControl::joy_callback, this);

    auto_sub = nh.subscribe("/cube/auto_cmd", 1, &JoystickControl::auto_callback, this);

    cmd_pub = nh.advertise<basic_ctrl::swing>("/cmd_man", 10);
  }

  void update_cmd(const ros::TimerEvent &)
  {
    // TODO
    // Publish control messages
    basic_ctrl::swing cmd_man;

    cmd_man.speed = speed;
    cmd_man.angular = angular;
    cmd_man.underarmF = swing_F;
    cmd_man.underarmB = swing_B;

    cmd_pub.publish(cmd_man);
  }

  void set_speed(float speed_)
  {
    speed = std::min(std::max(speed_, -max_speed), max_speed);
  }

  void set_angular_speed(float angular_)
  {
    angular = std::min(std::max(angular_, -max_angular), max_angular);
  }

  void auto_callback(const geometry_msgs::TwistStamped &msgIn)
  {
    if (mode == AUTO_MODE)
    {
      // TODO
    }
  }

  void joy_callback(const sensor_msgs::Joy &msgIn)
  {
    if (msgIn.buttons[joy_manual_button])
    {
      mode = MANUAL_MODE;
      ROS_INFO("Switched to manual control.");
    }
    else if (msgIn.buttons[joy_auto_button])
    {
      mode = AUTO_MODE;
      ROS_INFO("Switched to auto control.");
    }

    if (mode == MANUAL_MODE)
    {
      speed = joy_max_speed * msgIn.axes[joy_speed_axis];       // joy_max_speed=1
      angular = joy_max_angular * msgIn.axes[joy_angular_axis]; // joy_max_angular=1
      swing_F = -(msgIn.axes[joy_underarm_F] - 1) / 2;
      swing_B = -(msgIn.axes[joy_underarm_B] - 1) / 2;;
    }
  }
};

int main(int argc, char *argv[])
{
  ros::init(argc, argv, "joystick_control");
  JoystickControl jc;
  ros::spin();
  return 0;
}