# Make sure we have asdf before continuing
# TODO: Fix asdf
# include:
#   - asdf

asdf-node-plugin:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add nodejs
    - runas: jared
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep nodejs

asdf-node-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install nodejs latest
    - runas: jared
    - unless: test $(source /opt/asdf-vm/asdf.sh; asdf list nodejs | wc -l) -ge 1

asdf-node-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global nodejs latest
    - runas: jared


asdf-yarn-plugin:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add yarn
    - runas: jared
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep yarn

asdf-yarn-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install yarn latest
    - runas: jared
    - unless: test $(source /opt/asdf-vm/asdf.sh; asdf list yarn | wc -l) -ge 1

asdf-yarn-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global yarn latest
    - runas: jared

live-server:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; yarn install -g live-server
    - user: jared
    - unless: which live-server
