include:
  - rust

flameshot:
  pkg.installed

ripgrep:
  cmd.run:
    - name: cargo install ripgrep
    - unless: which rg
    - runas: jared
    - require:
        - rust

# LS replacement
exa:
  cmd.run:
    - name: cargo install exa
    - unless: which exa
    - runas: jared
    - require:
      - rust

zoxide:
  cmd.run:
    - name: cargo install zoxide
    - unless: which z
    - runas: jared
    - require:
      - rust

# JSON helper
jq:
  pkg.installed

# Automatic env management
direnv:
  cmd.run:
    - name: paru -S direnv --skipreview --noconfirm
    - runas: jared
    - unless: paru -Qi direnv

# Kubens/Kubectx
kubectx:
  pkg.installed

op:
  cmd.run:
    - names:
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: jared
    - unless: paru -Qi 1password-cli
