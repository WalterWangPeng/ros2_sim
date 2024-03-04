echo "now stop urdf"
tmux send-keys -t ros2sim_mapping:sim.0 '' C-c
sleep 1
echo "now stop gazebo"
tmux send-keys -t ros2sim_mapping:sim.1 '' C-c
sleep 1
echo "now stop teleop_robot"
tmux send-keys -t ros2sim_mapping:sim.2 '' C-c
sleep 1
echo "now stop cartographer"
tmux send-keys -t ros2sim_mapping:carto.0 '' C-c
tmux kill-session -t ros2sim_mapping