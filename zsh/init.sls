include:
  - cli-utils

p10k:
  file.managed:
    - name: /home/jared/.p10k.zsh
    - source: salt://zsh/p10k.zsh
    - user: jared

zprezto-install:
  cmd.script:
    - source: salt://zsh/prezto-install.zsh
    - unless: test -d ~/.zprezto
    - runas: jared

zprezto-update:
  cmd.script:
    - only: test -d ~/.zprezto
    - runas: jared
    - source: salt://zsh/prezto-update.zsh

