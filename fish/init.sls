include:
  - cli-utils

fish:
  pkg.installed

starship:
  cmd.run:
    - name: paru -S starship --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi starship

starship-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/starship.toml
    - source: salt://fish/starship.toml
    - runas: {{ grains['user'] }}

fish-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/fish
    - source: salt://fish/fish
    - user: {{ grains['user'] }}
    - clean: true

fish-completions:
  file.managed:
    - name: /usr/share/fish/completions/exa.fish
    - source: https://raw.githubusercontent.com/ogham/exa/6af9e221a4a20066de716e1ef8455b45829ef768/completions/fish/exa.fish
    - skip_verify: true

