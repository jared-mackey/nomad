include:
  - rust

flameshot:
  pkg.installed

# Cargo installed
ripgrep:
  cmd.run:
    - name: cargo install ripgrep
    - unless: which rg
    - runas: jared
    - require:
        - rust

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
    - unless: which zoxide
    - runas: jared
    - require:
      - rust

xsv:
  cmd.run:
    - name: cargo install xsv
    - unless: which xsv
    - runas: jared
    - require:
      - rust

btm:
  cmd.run:
    - name: cargo install bottom
    - unless: which btm
    - runas: jared
    - require:
      - rust

bat:
  cmd.run:
    - name: cargo install bat
    - unless: which bat
    - runas: jared
    - require:
      - rust

fd:
  cmd.run:
    - name: cargo install fd-find
    - unless: which fd
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

kubectl:
  pkg.installed

op:
  cmd.run:
    - names:
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: jared
    - unless: paru -Qi 1password-cli
