installed:
  git.cloned:
    - name: https://github.com/asdf-vm/asdf.git
    - target: {{ pillar['xdg_code_home'] }}/asdf
    - user: {{ grains['user'] }}
