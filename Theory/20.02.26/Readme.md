# Docker Overlay Networks (Multi-Host)

**Date:** 20-02-2026  
**Topic:** Overlay Networks for Multi-Host Container Communication

---

## 1. Overlay Networks (Multi-Host)

### What is Overlay?

When you have multiple servers (hosts) running Docker, containers need to talk across hosts. Overlay networks create a virtual network that spans all hosts.

**Analogy:** Imagine tunnels connecting buildings – containers in different buildings can talk as if they're next door.

---

## Prerequisites for Overlay

1. **Docker Swarm mode enabled** (Docker's clustering solution)
2. **Ports open** between hosts:
   - **2377/tcp:** Swarm management
   - **7946/tcp/udp:** Node communication
   - **4789/udp:** Overlay network traffic

---

## Important Note for Beginners

### If you're on a laptop/college WiFi:

- Overlay networks for **multi-host** likely won't work (WiFi blocks the ports)
- But you can still **learn** by running everything on one machine!

---

## Single-Machine Overlay Lab (Learning Purpose)

```bash
# Step 1: Initialize Swarm (on one machine)
# --advertise-addr tells Swarm "I'm at this IP"
# Use 127.0.0.1 for learning (only works locally!)
docker swarm init --advertise-addr 127.0.0.1

# Step 2: Create overlay network
# --attachable allows regular containers to use it
docker network create -d overlay --attachable my_overlay

# Step 3: Run containers (they'll all be on same machine)
docker run -d --network my_overlay --name app1 alpine sleep 3600
docker run -d --network my_overlay --name app2 alpine sleep 3600

# Step 4: Test communication
docker exec app1 ping app2  # Works!
```
![Swarm](./Images/1.png)
![Swarm](./Images/2.png)
![Swarm](./Images/3.png)
![Swarm](./Images/3-a.png)
![Swarm](./Images/4.png)
---

## Why This Works (Even on One Machine)

- Overlay is designed for multiple hosts
- But Docker still creates the overlay network infrastructure locally
- Containers can communicate through the overlay network
- Great for learning the concepts without needing multiple physical machines

---

## Real Multi-Host Setup (For Reference)

### On Host 1 (Manager):

```bash
# Initialize with actual IP
docker swarm init --advertise-addr 192.168.1.10

# Shows join command for workers
docker swarm join-token worker
```

### On Host 2 (Worker):

```bash
# Run the join command from manager
docker swarm join --token SWMTKN-1-xxxx 192.168.1.10:2377
```

### On Manager (after workers joined):

```bash
# Create overlay (now spans both hosts)
docker network create -d overlay prod_net

# Deploy service (spreads across hosts)
docker service create \
  --name web \
  --network prod_net \
  --replicas 4 \
  nginx
```

---

## Key Concepts

### 🔹 Overlay Network Benefits
- **Multi-host communication:** Containers on different hosts can communicate seamlessly
- **Automatic encryption:** Built-in security for container-to-container traffic
- **Load balancing:** Services can be distributed across multiple hosts
- **Scalability:** Easy to add more hosts to the swarm

### 🔹 Docker Swarm Components
- **Manager Node:** Controls the swarm, schedules services
- **Worker Node:** Runs containers as assigned by manager
- **Service:** Defines how containers should run (replicas, network, etc.)

### 🔹 Network Drivers
- **Bridge:** Default, single-host networking
- **Overlay:** Multi-host networking (requires Swarm)
- **Host:** Container uses host's network directly
- **None:** No networking

---

## Practical Commands Reference

### Swarm Management
```bash
# Initialize swarm
docker swarm init --advertise-addr <MANAGER-IP>

# Get join token
docker swarm join-token worker

# List nodes in swarm
docker node ls

# Leave swarm
docker swarm leave --force
```

### Overlay Network Commands
```bash
# Create overlay network
docker network create -d overlay --attachable <network-name>

# List networks
docker network ls

# Inspect overlay network
docker network inspect <network-name>

# Remove network
docker network rm <network-name>
```



---

## Troubleshooting

### Common Issues

1. **Swarm init fails**
   - Check if ports 2377, 7946, 4789 are open
   - Ensure correct IP address is used

2. **Containers can't communicate**
   - Verify both containers are on same overlay network
   - Check if overlay network is attachable (for non-service containers)

3. **Worker can't join**
   - Check firewall rules between hosts
   - Verify token is correct and not expired

### Testing Connectivity
```bash
# Test if containers can reach each other
docker exec <container-name> ping <other-container-name>

# Check container network configuration
docker inspect <container-name> | grep -A 20 NetworkSettings
```

---

## Summary

✅ **Overlay networks** enable multi-host container communication  
✅ **Docker Swarm** is required for overlay networks  
✅ **Learning on single machine** is possible and recommended for practice  
✅ **Ports 2377, 7946, 4789** must be open for multi-host setup  
✅ **Services** automatically distribute across swarm nodes  

---


**📝 Note:** This lab demonstrates overlay networking concepts. In production environments, you would typically have multiple physical hosts or VMs forming the swarm cluster.