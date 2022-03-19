rust:
  pkg.installed:
    - name: rustup

rustconfig:
  file.managed:
    - name: /home/{{ grains['user'] }}/.cargo/config.toml
    - source: salt://rust/config.toml
