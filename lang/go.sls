include:
  - asdf

{% set asdf_path = pillar['xdg_code_home'] + '/asdf' %}

asdf-golang-plugin:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add golang
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list all | grep golang

asdf-golang-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install golang latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf list golang | wc -l) -ge 1

asdf-golang-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global golang latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf current golang | wc -l) -ge 1


