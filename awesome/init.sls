include:
  - lua
  - rofi
  - cli-utils

awesome:
  pkg.installed

rubato:
  git.latest:
    - name: https://github.com/andOrlando/rubato.git
    - target: /home/{{ grains['user'] }}/.config/awesome/module/rubato
    - user: {{ grains['user'] }}

awesome-configs:
  file.recurse:
    - name: /home/{{ grains['user'] }}/.config/awesome
    - source: salt://awesome/awesome
    - user: {{ grains['user'] }}
    - makedirs: True
    - force: True

awesome-bling:
  git.latest:
    - name: https://github.com/BlingCorp/bling
    - target: /home/{{ grains['user'] }}/.config/awesome/module/bling
    - user: {{ grains['user'] }}

awesome-layout-machi:
  git.latest:
    - name: https://github.com/xinhaoyuan/layout-machi
    - target: /home/{{ grains['user'] }}/.config/awesome/module/layout-machi
    - user: {{ grains['user'] }}
