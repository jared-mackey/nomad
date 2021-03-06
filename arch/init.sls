include:
  - crons
  - awesome
  - picom
  - ntp

reflector:
  pkg.installed:
    - name: reflector

reflector-config:
  file.managed:
    - name: /etc/xdg/reflector/reflector.conf
    - source: salt://arch/reflector.conf
    - require:
      - pkg: reflector

reflector-running:
  service.running:
    - name: reflector.timer
    - enable: True
    - require:
      - pkg: reflector
    - watch:
      - file: reflector-config

pacman-download-updates:
  cron.present:
    - user: root
    - identifier: "download pacman updates without applying"
    - name: pacman -Syuw --noconfirm
    # every two hours
    - minute: 0
    - hour: "*/2"
