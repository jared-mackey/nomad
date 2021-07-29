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
    - name: /home/jared/.config/awesome
    - source: salt://awesome/awesome
    - user: jared
    - makedirs: True
    - force: True

awesome-bling:
  git.latest:
    - name: https://github.com/BlingCorp/bling
    - target: /home/jared/.config/awesome/module/bling
    - user: jared

awesome-layout-machi:
  git.latest:
    - name: https://github.com/xinhaoyuan/layout-machi
    - target: /home/jared/.config/awesome/module/layout-machi
    - user: jared
