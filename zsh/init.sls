include:
  - cli-utils
  - nvim

p10k:
  file.managed:
    - name: /home/{{ grains['user'] }}/.p10k.zsh
    - source: salt://zsh/p10k.zsh
    - user: {{ grains['user'] }}

zprezto-install:
  cmd.script:
    - source: salt://zsh/prezto-install.zsh
    - unless: test -d ~/.zprezto
    - runas: {{ grains['user'] }}

zprezto-update:
  cmd.script:
    - only: test -d ~/.zprezto
    - runas: {{ grains['user'] }}
    - source: salt://zsh/prezto-update.zsh

zprezto-config:
  file.managed:
    - name: /home/{{ grains['user'] }}/.zshrc
    - source: salt://zsh/zshrc
    - user: {{ grains['user'] }}

