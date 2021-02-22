#!/bin/bash



gnome-terminal \
  --tab-with-profile=halt -e '/bin/bash -c "\
    cd ~/catkin_ws/src/ROBOTIS-OP3-Common/op3_gazebo/launch; \
    roslaunch robotis_kitchen_dining_world.launch;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 5;\
    roslaunch op3_manager op3_gazebo.launch;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 6;\
    roslaunch op3_gui_demo op3_demo.launch;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 7;\
    cd ~/WebUI/nodejs_channel_server; \
    node channel_server.js; \
  " ' \
    --tab-with-profile=halt -e '/bin/bash -i -c "\
    sleep 10;\
    cd ~/WebUI/startup_script; \
    ./ros1.sh restart\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 15;\
    rosservice call gazebo/unpause_physics;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /robotis_op3/camera/image_raw to /archie/camera/image_raw;\
    source ~/catkin_ws/devel/setup.bash
    rosrun topic_tools relay /robotis_op3/camera/image_raw /archie/camera/image_raw;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /robotis/status to /archie/status;\
    source ~/catkin_ws/devel/setup.bash
    rosrun topic_tools relay /robotis/status /archie/status;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /archie/head_control/set_joint_states to /robotis/head_control/set_joint_states;\
    source ~/catkin_ws/devel/setup.bash
    rosrun topic_tools relay /archie/head_control/set_joint_states /robotis/head_control/set_joint_states;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /archie/base/ini_pose to /robotis/base/ini_pose;\
    source ~/catkin_ws/devel/setup.bash
    rosrun topic_tools relay /archie/base/ini_pose /robotis/base/ini_pose;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /archie/enable_ctrl_module to /robotis/enable_ctrl_module;\
    source ~/catkin_ws/devel/setup.bash
    rosrun topic_tools relay /archie/enable_ctrl_module /robotis/enable_ctrl_module;\
  " ' \
  --tab-with-profile=halt -e '/bin/bash -c "\
    sleep 17;\
    echo Starting to relay topic /archie/action/predefined_num to /robotis/action/page_num;\
    source ~/catkin_ws/devel/setup.bash    
    rosrun topic_tools relay /archie/action/predefined_num /robotis/action/page_num;\
  " ' 

  # --tab-with-profile=halt -e '/bin/bash -c "\
  #   rosservice call gazebo/unpause_physics;\
  # " ' 
# start of the simulation in 3 terminals:
# roslaunch op3_gazebo robotis_world.launch
# Start the simulation with the play button in gazebo!!!!!
# roslaunch op3_manager op3_gazebo.launch
# roslaunch op3_gui_demo op3_demo.launch

# --tab-with-profile=halt -e '/bin/bash -c "\
# roslaunch op3_manager op3_gazebo.launch;\
# " ' \
# --tab-with-profile=halt -e '/bin/bash -c "\
# roslaunch op3_gui_demo op3_demo.launch;\
# " ' \
