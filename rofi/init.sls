rofi:
  pkg.installed

rofi-config:
  file.recurse:
    - name: /home/{{ grains['user'] }}/.config/rofi
    - source: salt://rofi/rofi
    - user: {{ grains['user'] }}
    - force: True

rofi-emoji:
  cmd.run:
    - name: paru -S rofi-emoji --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi rofi-emoji

rofi-calc:
  pkg.installed

