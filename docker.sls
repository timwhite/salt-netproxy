python-pip:
  pkg.installed
docker-py:
  pip.installed:
    - require:
      - pkg: python-pip

python preprocess.py:
  cmd.run:
    - name: python preprocess.py
    - cwd: /root/netproxy
    - creates: /root/netproxy/config.json


skorokithakis/netproxy:
  docker.built:
    - path: /root/netproxy

netproxy-docker:
  docker.installed:
    - name: netproxy
    - image: skorokithakis/netproxy
    - network_mode: bridge
    - ports:
      - "80/tcp"
      - "443/tcp"
netproxy-docker-run:
  docker.running:
    - name: netproxy
    - image: skorokithakis/netproxy
    - network_mode: bridge
    - port_bindings:
        "80/tcp":
            HostIp: "0.0.0.0"
            HostPort: "80"
        "443/tcp":
            HostIp: "0.0.0.0"
            HostPort: "443"
