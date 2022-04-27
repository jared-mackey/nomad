include:
  - asdf

{% set asdf_path = pillar['xdg_code_home'] + '/asdf' %}

asdf-node-plugin:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add nodejs
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list all | grep nodejs

asdf-node-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install nodejs latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf list nodejs | wc -l) -ge 1

asdf-node-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global nodejs latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf current nodejs | wc -l) -ge 1

asdf-yarn-plugin:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add yarn
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list all | grep yarn

asdf-yarn-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install yarn latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf list yarn | wc -l) -ge 1

asdf-yarn-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global yarn latest
    - runas: {{ grains['user'] }}
    - unless: test $(source {{ asdf_path }}/asdf.sh; asdf current yarn | wc -l) -ge 1

live-server:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; yarn install -g live-server
    - user: {{ grains['user'] }}
    - unless: which live-server
