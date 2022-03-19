gitconfig:
  file.managed:
    - name: /home/{{ grains['user'] }}/.config/git/config
    - source: salt://git/gitconfig
    - user: {{ grains['user'] }}
    - makedirs: true

gitignore:
  file.managed:
    - name: /home/{{ grains['user'] }}/.config/git/gitignore
    - source: salt://git/gitignore
    - user: {{ grains['user'] }}
