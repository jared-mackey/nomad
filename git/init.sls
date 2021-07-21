gitconfig:
  file.managed:
    - name: /home/jared/.config/git/config
    - source: salt://git/gitconfig
    - user: jared
    - makedirs: true

gitignore:
  file.managed:
    - name: /home/jared/.config/git/gitignore
    - source: salt://git/gitignore
    - user: jared
