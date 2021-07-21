kitty:
  pkg.installed

kitty-config:
  file.recurse:
    - name: /home/jared/.config/kitty
    - source: salt://kitty/kitty
    - user: jared
