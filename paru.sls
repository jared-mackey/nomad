paru:
  file.managed:
    - name: /home/{{ grains['user'] }}/.config/paru/paru.conf
    - source: salt://paru.conf
    - user: {{ grains['user'] }}
