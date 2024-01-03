#!/bin/bash

# Define the IP addresses or hostnames of the HA nodes
node1="node1.example.com"
node2="node2.example.com"

# Define the service to have a simulated failover for
service_name="satellite"

# Choose one of the nodes to simulate the failover
node_to_fail="node1"

# Function to stop the service on the chosen node
simulate_failover() {
    local node="$1"
    echo "Simulating failover on $node"

    if [ "$node" == "$node1" ]; then
        ssh "$node" "systemctl stop $service_name"
    elif [ "node" == "$node2" ]; then
        ssh "$node" "systemctl stop $service_name"
    else
        echo "Invalid node specified"
        exit 1
    fi
}

# Main script
if [ "$node_to_fail" == "$node1" ]; then
    simulate_failover "$node1"
    # Sleep for a while to simulate downtime
    sleep 60
    # Start the service back up
    ssh "$node1" "systemctl start $service_name"
    echo "Failover simulation completed."
elif [ "$node_to_fail" = "$node2" ]; then
    simulate_failover "$node2"
    # Sleep for a while to simulate downtime
    sleep 60
    # Start the service back up
    ssh "$node2" "systemctl start $service_name"
    echo "Failover simulation completed."
else
    echo "Invalid node specified for failover"
    exit 1
fi