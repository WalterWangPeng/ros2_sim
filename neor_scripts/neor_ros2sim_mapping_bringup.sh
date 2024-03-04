tmux source ~/.tmux.conf
tmux new -d -s ros2sim_mapping_nero -n empty
#空白窗口：用户自由使用
tmux split-window -h -t ros2sim_mapping_nero:empty
tmux split-window -v -t ros2sim_mapping_nero:empty.1
tmux split-window -v -t ros2sim_mapping_nero:empty.0
#机器人显示和控制
tmux new-window -n sim -t ros2sim_mapping_nero
tmux split-window -h -t ros2sim_mapping_nero:sim
tmux split-window -v -t ros2sim_mapping_nero:sim.1
tmux split-window -v -t ros2sim_mapping_nero:sim.0
#gmapping
tmux new-window -n carto -t ros2sim_mapping_nero
tmux split-window -h -t ros2sim_mapping_nero:carto
tmux split-window -v -t ros2sim_mapping_nero:carto.1
tmux split-window -v -t ros2sim_mapping_nero:carto.0
#地图构建启动
echo "now start gazebo"
tmux send-keys -t ros2sim_mapping_nero:sim.0 'source ~/ros2_sim/install/setup.bash && ros2 launch neor_mini_foxy neor_mini_gazebo_mapping.launch.py' C-m
echo "please wait 1 seconds for next step.."
sleep 1
echo "now start teleop_robot"
tmux send-keys -t ros2sim_mapping_nero:sim.2 'ros2 run teleop_twist_keyboard teleop_twist_keyboard' C-m
echo "please wait 1 seconds for next step.."
sleep 1
echo "now start cartographer"
tmux send-keys -t ros2sim_mapping_nero:carto.0 'source ~/ros2_sim/install/setup.bash && ros2 launch neor_mini_cartographer neor_mini_cartographer.launch.py' C-m
tmux send-keys -t ros2sim_mapping_nero:carto.1 'ros2 run nav2_map_server map_saver_cli -t map -f ~/ros2_sim/src/neor_mini/neor_mini_foxy/map/<you_map_name>'
tmux a -t ros2sim_mapping_nero:sim