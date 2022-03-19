include:
  - lua
  - rofi
  - cli-utils

awesome:
  pkg.installed

awestore:
  cmd.run:
   - name: luarocks --lua-version 5.3 install awestore

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
