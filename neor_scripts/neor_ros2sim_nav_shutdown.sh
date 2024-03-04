echo "stop urdf"
tmux send-keys -t ros2sim_nav_neor:sim.0 '' C-c
sleep 1
echo "stop navigation2"
tmux send-keys -t ros2sim_nav_neor:nav.0 '' C-c
sleep 1
tmux kill-session -t ros2sim_nav_neor
