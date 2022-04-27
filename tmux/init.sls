include:
  - lang.go
  - lang.ruby

{% set tmux_dir = pillar['xdg_config_home'] + '/tmux' %}
{% set asdf_path = pillar['xdg_code_home'] + '/asdf' %}

tmux:
  pkg.installed

tmux-config:
  file.managed:
    - name: {{ tmux_dir }}/tmux.conf
    - source: salt://tmux/tmux.conf
    - user: {{ grains['user'] }}

embark-tmux:
  file.managed:
    - name: {{ tmux_dir }}/embark.tmux
    - source: salt://tmux/embark.tmux
    - user: {{ grains['user'] }}
    - makedirs: True

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ tmux_dir }}/plugins/tpm
    - user: {{ grains['user'] }}

tmuxinator:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf reshim; gem install tmuxinator
    - user: {{ grains['user'] }}

tmuxinator-configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/tmuxinator
    - source: salt://tmux/tmuxinator/
    - user: {{ grains['user'] }}
    - makedirs: True
    - force: True

tmux-launcher:
  file.managed:
    - name: /home/{{ grains['user'] }}/.local/bin/rally.sh
    - source: salt://tmux/rally.sh
    - mode: keep
    - user: {{ grains['user'] }}
    - force: True
