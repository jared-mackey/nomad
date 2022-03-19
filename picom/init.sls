picom:
  cmd.run:
    - name: paru -S picom-jonaburg-git --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi picom-jonaburg-git

picom-config:
  file.managed:
    - name: /home/{{ grains['user'] }}/.config/picom.conf
    - source: salt://picom/picom.conf
    - makedirs: True

