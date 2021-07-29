picom:
  cmd.run:
    - name: paru -S picom-jonaburg-git --skipreview --noconfirm
    - runas: jared
    - unless: paru -Qi picom-jonaburg-git

picom-config:
  file.managed:
    - name: /home/jared/.config/picom.conf
    - source: salt://picom/picom.conf
    - makedirs: True

