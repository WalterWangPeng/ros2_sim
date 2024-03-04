echo "stop urdf"
tmux send-keys -t ros2sim_nav:sim.0 '' C-c
sleep 1
echo "stop gazebo"
tmux send-keys -t ros2sim_nav:sim.1 '' C-c
sleep 1
echo "stop navigation2"
tmux send-keys -t ros2sim_nav:nav.0 '' C-c
sleep 1
tmux kill-session -t ros2sim_nav
