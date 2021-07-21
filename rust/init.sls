rust:
  pkg.installed:
    - name: rustup

rustconfig:
  file.managed:
    - name: /home/jared/.cargo/config.toml
    - source: salt://rust/config.toml
