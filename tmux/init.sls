tmux:
  file.managed:
    - name: /home/jared/.tmux.conf
    - source: salt://tmux/tmux.conf
    - user: jared

