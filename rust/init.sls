{% set cargo_path = '/home/' + grains['user'] + '/.cargo/bin' %}

rust:
  pkg.installed:
    - name: rustup
    - unless: test -f {{ cargo_path }}/cargo

rustconfig:
  file.managed:
    - name: /home/{{ grains['user'] }}/.cargo/config.toml
    - source: salt://rust/config.toml
