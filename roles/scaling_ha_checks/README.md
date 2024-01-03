Notes for dev:

The failover simualtion script does the following:

1. Defines the IP addresses or hostnames for the two (assumed) HA nodes
2. Specify the services to simulate the failover for (and just as a placeholder, I've chosen to use 'satellite')
3. Choose which node to simulate the failover on (node1 or node2)
4. The 'simulate_failover' function stops the specified service on the chosen node via SSH.
5. In the main part of the script, it simulates the failover by stopping the service, waiting for a defined period (60 seconds in this example), and then starting the service back up.