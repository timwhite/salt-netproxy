netproxy-git:
  git.latest:
    - name: https://github.com/skorokithakis/netproxy.git
    - target: /root/netproxy
    - require:
      - pkg: git
  cmd.wait:
    - name: python preprocess.py
    - cwd: /root/netproxy
    - watch:
      - git: netproxy-git
git:
  pkg.installed
