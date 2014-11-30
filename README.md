# Salt States for Netflix Proxy

This repository has the salt states needed for deploying a netproxy server via salt. Take note of the ports as it currently only deploys without the DNS server for security.

## Salt Cloud Config
```bash
$ cat /etc/salt/cloud.conf.d/minion.conf 
minion:
  master: saltmasterhostname
  startup_states: highstate
```

Profile for Digital Ocean to use the Ubuntu image with Docker already installed
```bash
$ cat /etc/salt/cloud.profiles.d/digitalocean.conf 
ubuntu_docker_ny3:
  provider: do
  image: Docker 1.3.2 on 14.04
  size: 512MB 
  location: New York 1
```
