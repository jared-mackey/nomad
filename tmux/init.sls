tmux:
  file.managed:
    - name: /home/{{ grains['user'] }}/.tmux.conf
    - source: salt://tmux/tmux.conf
    - user: {{ grains['user'] }}

