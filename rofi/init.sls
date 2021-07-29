rofi:
  pkg.installed

rofi-config:
  file.recurse:
    - name: /home/jared/.config/rofi
    - source: salt://rofi/rofi
    - user: jared
    - force: True

rofi-emoji:
  cmd.run:
    - name: paru -S rofi-emoji --noconfirm --skipreview
    - runas: jared
    - unless: paru -Qi rofi-emoji

rofi-calc:
  pkg.installed

