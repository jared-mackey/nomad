# Make sure we have asdf before continuing
include:
  - asdf

{% set erlang_version = '24.3.2' %}
{% set elixir_version = '1.13.3-otp-24' %}
{% set asdf_path = pillar['xdg_code_home'] + '/asdf' %}

asdf-erlang-plugin:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list all | grep erlang

asdf-erlang-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install erlang {{ erlang_version }}
    - runas: {{ grains['user'] }}

asdf-erlang-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global erlang {{ erlang_version }}
    - runas: {{ grains['user'] }}

# install elixir
asdf-elixir-plugin:
  pkg.installed:
    - name: unzip
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    - runas: {{ grains['user'] }}
    - unless: source {{ asdf_path }}/asdf.sh; asdf plugin-list all | grep elixir

asdf-elixir-install:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf install elixir {{ elixir_version }}
    - runas: {{ grains['user'] }}

asdf-elixir-global:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf global elixir {{ elixir_version }}
    - runas: {{ grains['user'] }}

install-package-toolchains:
  cmd.run:
    - name: source {{ asdf_path }}/asdf.sh; asdf reshim; mix local.hex --if-missing --force; mix local.rebar --force
    - runas: {{ grains['user'] }}
    - env:
      - LANG: en_US.UTF-8

# get language server in place
elixir-language-server:
  git.latest:
    - name: https://github.com/elixir-lsp/elixir-ls.git
    - target: /home/{{ grains['user'] }}/dev/private/elixir-ls
    - user: {{ grains['user'] }}

  cmd.run:
    - cwd: /home/{{ grains['user'] }}/dev/private/elixir-ls
    - runas: {{ grains['user'] }}
    - name: source {{ asdf_path }}/asdf.sh; asdf reshim; mix deps.get; mix compile; mix elixir_ls.release -o rel
    - env:
      - LANG: en_US.UTF-8
    - onchanges:
      - git: elixir-language-server
