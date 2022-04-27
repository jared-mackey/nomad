include:
  - rust

{% set cargo_path = '/home/' + grains['user'] + '/.cargo/bin' %}

flameshot:
  pkg.installed

ripgrep:
  cmd.run:
    - name: cargo install ripgrep
    - unless: test -f {{ cargo_path }}/rg
    - runas: {{ grains['user'] }}
    - require:
        - rust

watchexec:
  cmd.run:
    - name: cargo install watchexec-cli
    - unless: test -f {{ cargo_path }}/watchexec
    - runas: {{ grains['user'] }}
    - require:
      - rust

sk:
  cmd.run:
    - name: cargo install skim
    - unless: test -f {{ cargo_path }}/sk
    - runas: {{ grains['user'] }}
    - require:
      - rust

exa:
  cmd.run:
    - name: cargo install exa
    - unless: test -f {{ cargo_path }}/exa
    - runas: {{ grains['user'] }}
    - require:
      - rust

zoxide:
  cmd.run:
    - name: cargo install zoxide
    - unless: test -f {{ cargo_path }}/zoxide
    - runas: {{ grains['user'] }}
    - require:
      - rust

xsv:
  cmd.run:
    - name: cargo install xsv
    - unless: test -f {{ cargo_path }}/xsv
    - runas: {{ grains['user'] }}
    - require:
      - rust

tokei:
  cmd.run:
    - name: cargo install tokei
    - unless: test -f {{ cargo_path }}/tokei
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
    - unless: test -f {{ cargo_path }}/bat
    - runas: {{ grains['user'] }}
    - require:
      - rust

fd:
  cmd.run:
    - name: cargo install fd-find
    - unless: test -f {{ cargo_path }}/fd
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

