tmux source ~/.tmux.conf
tmux new -d -s ros2sim_nav_neor -n empty
#空白窗口：用户自由使用
tmux split-window -h -t ros2sim_nav_neor:empty
tmux split-window -v -t ros2sim_nav_neor:empty.1
tmux split-window -v -t ros2sim_nav_neor:empty.0
#机器人nav
tmux new-window -n sim -t ros2sim_nav_neor
tmux split-window -h -t ros2sim_nav_neor:sim
tmux split-window -v -t ros2sim_nav_neor:sim.1
tmux split-window -v -t ros2sim_nav_neor:sim.0
#机器人nav
tmux new-window -n nav -t ros2sim_nav_neor
tmux split-window -h -t ros2sim_nav_neor:nav
tmux split-window -v -t ros2sim_nav_neor:nav.1
tmux split-window -v -t ros2sim_nav_neor:nav.0
#sim start
echo "now start urdf"
tmux send-keys -t ros2sim_nav_neor:sim.0 'source ~/ros2_sim/install/setup.bash && ros2 launch neor_mini_foxy neor_mini_gazebo_mapping.launch.py' C-m
echo "please wait 1 seconds for next step.."
sleep 1
echo "now start navigation2"
sleep 1
tmux send-keys -t ros2sim_nav_neor:nav.0 'source ~/ros2_sim/install/setup.bash && ros2 launch neor_mini_navigation2 neor_mini_navigation2.launch.py' C-m
tmux a -t ros2sim_nav_neor:nav