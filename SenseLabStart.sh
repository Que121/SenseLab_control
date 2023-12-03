
#!/bin/bash
gnome-terminal --tab -- bash -c "roscore"
# 启动hw节点
gnome-terminal --tab -- bash -c "mon launch sl_start sl_hw.launch"
# 加载控制器
gnome-terminal --tab -- bash -c "mon launch sl_start load_controllers.launch"
# 启动控制器
rosrun controller_manager controller_manager start controllers/robot_state_controller
rosrun controller_manager controller_manager start controllers/chassis_controller
sleep 5s
# 设置参数
gnome-terminal --tab -- bash -c "rostopic pub /cmd_chassis rm_msgs/ChassisCmd \"mode: 0
accel:
  linear: {x: 3.0, y: 3.0, z: 0.0}
  angular: {x: 0.0, y: 0.0, z: 4.0}
power_limit: 200.0
follow_source_frame: ''
command_source_frame: ''
stamp: {secs: 0, nsecs: 0}\""
