include:
  - asdf

{% set asdf_path = pillar['xdg_code_home'] + '/asdf' %}

asdf-ruby-plugin:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add ruby
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list | grep ruby

asdf-ruby-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install ruby latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf list ruby | wc -l) -ge 1

asdf-ruby-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global ruby latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf current ruby | wc -l) -ge 1


