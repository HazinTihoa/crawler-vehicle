cmake_minimum_required(VERSION 3.0.2)
project(basic_ctrl)

find_package(catkin REQUIRED COMPONENTS
  tf
  rospy
  roscpp
  std_msgs
  nav_msgs
  sensor_msgs
  geometry_msgs
  message_generation
)

add_message_files(
  FILES
  swing.msg
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package(
  # INCLUDE_DIRS include
  # LIBRARIES basic_ctrl
  CATKIN_DEPENDS std_msgs message_runtime
)

include_directories(
include
  ${catkin_INCLUDE_DIRS}
)

add_executable(joy_node src/joy_node.cpp)
add_dependencies(joy_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(joy_node
  ${catkin_LIBRARIES}
)

add_executable(joy_itrctrl src/joy_itrctrl.cpp)
add_dependencies(joy_itrctrl ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS} ${PROJECT_NAME}_generate_messages_cpp)
target_link_libraries(joy_itrctrl
  ${catkin_LIBRARIES}
)