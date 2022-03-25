include:
  - rust

flameshot:
  pkg.installed

# Cargo installed
ripgrep:
  cmd.run:
    - name: cargo install ripgrep
    - unless: which rg
    - runas: {{ grains['user'] }}
    - require:
        - rust

watchexec:
  cmd.run:
    - name: cargo install watchexec-cli
    - unless: which watchexec
    - runas: {{ grains['user'] }}
    - require:
      - rust

exa:
  cmd.run:
    - name: cargo install exa
    - unless: which exa
    - runas: {{ grains['user'] }}
    - require:
      - rust

zoxide:
  cmd.run:
    - name: cargo install zoxide
    - unless: which zoxide
    - runas: {{ grains['user'] }}
    - require:
      - rust

zellij:
  cmd.run:
    - name: cargo install zellij
    - unless: which zellij
    - runas: {{ grains['user'] }}
    - require:
      - rust
  
  file.managed:
    - name: /home/{{ grains['user'] }}/.config/zellij/config.yaml
    - source: salt://cli-utils/zellij.yaml
    - makedirs: True

xsv:
  cmd.run:
    - name: cargo install xsv
    - unless: which xsv
    - runas: {{ grains['user'] }}
    - require:
      - rust

tokei:
  cmd.run:
    - name: cargo install tokei
    - unless: which tokei
    - runas: {{ grains['user'] }}
    - require:
      - rust

btop:
  cmd.run:
    - name: paru -S btop --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi btop

  file.managed:
    - name: /home/{{ grains['user'] }}/.config/btop/themes/embark.theme
    - source: salt://cli-utils/btop-embark.theme
    - makedirs: true

bat:
  cmd.run:
    - name: cargo install bat
    - unless: which bat
    - runas: {{ grains['user'] }}
    - require:
      - rust

fd:
  cmd.run:
    - name: cargo install fd-find
    - unless: which fd
    - runas: {{ grains['user'] }}
    - require:
      - rust

# JSON helper
jq:
  pkg.installed

# Automatic env management
direnv:
  cmd.run:
    - name: paru -S direnv --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi direnv

# Kubens/Kubectx
kubectx:
  pkg.installed

kubectl:
  pkg.installed

op:
  cmd.run:
    - names:
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi 1password-cli

# Wallpapers
nitrogen:
  pkg.installed

# Audio things?
playerctl:
  pkg.installed

# Other
fswatch:
  cmd.run:
    - name: paru -S fswatch --skipreview --noconfirm
    - runas: {{ grains['user'] }}
    - unless: paru -Qi fswatch
