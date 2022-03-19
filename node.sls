# Make sure we have asdf before continuing
# TODO: Fix asdf
# include:
#   - asdf

asdf-node-plugin:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add nodejs
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep nodejs

asdf-node-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install nodejs latest
    - runas: {{ grains['user'] }}
    - unless: test $(source /opt/asdf-vm/asdf.sh; asdf list nodejs | wc -l) -ge 1

asdf-node-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global nodejs latest
    - runas: {{ grains['user'] }}


asdf-yarn-plugin:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add yarn
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep yarn

asdf-yarn-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install yarn latest
    - runas: {{ grains['user'] }}
    - unless: test $(source /opt/asdf-vm/asdf.sh; asdf list yarn | wc -l) -ge 1

asdf-yarn-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global yarn latest
    - runas: {{ grains['user'] }}

live-server:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; yarn install -g live-server
    - user: {{ grains['user'] }}
    - unless: which live-server
