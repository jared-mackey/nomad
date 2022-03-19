kitty:
  pkg.installed

kitty-config:
  file.recurse:
    - name: /home/{{ grains['user'] }}/.config/kitty
    - source: salt://kitty/kitty
    - user: {{ grains['user'] }}
