tmux source ~/.tmux.conf
tmux new -d -s ros2sim_nav -n empty
#空白窗口：用户自由使用
tmux split-window -h -t ros2sim_nav:empty
tmux split-window -v -t ros2sim_nav:empty.1
tmux split-window -v -t ros2sim_nav:empty.0
#机器人nav
tmux new-window -n sim -t ros2sim_nav
tmux split-window -h -t ros2sim_nav:sim
tmux split-window -v -t ros2sim_nav:sim.1
tmux split-window -v -t ros2sim_nav:sim.0
#机器人nav
tmux new-window -n nav -t ros2sim_nav
tmux split-window -h -t ros2sim_nav:nav
tmux split-window -v -t ros2sim_nav:nav.1
tmux split-window -v -t ros2sim_nav:nav.0
#sim start
echo "now start urdf"
tmux send-keys -t ros2sim_nav:sim.0 'source ~/ros2_sim/install/setup.bash && ros2 launch ayuan_description ayuan_description.launch.py' C-m
echo "please wait 1 seconds for next step.."
sleep 1
echo "now start gazebo"
tmux send-keys -t ros2sim_nav:sim.1 'source ~/ros2_sim/install/setup.bash && ros2 launch ayuan_description ayuan_gazebo.launch.py' C-m
echo "please wait 1 seconds for next step.."
sleep 1
echo "now start navigation2"
sleep 1
tmux send-keys -t ros2sim_nav:nav.0 'source ~/ros2_sim/install/setup.bash && ros2 launch ayuan_navigation2 ayuan_navigation2.launch.py' C-m
tmux a -t ros2sim_nav:nav