# Make sure we have asdf before continuing
# TODO: Fix asdf
# include:
#   - asdf

{% set erlang_version = '24.0.3' %}
{% set elixir_version = '1.12.1-otp-24' %}

# IMPORTANT: Asdf is a sourced function
# Since we might be in a shell that hasn't yet sourced it we need to source it before any calls to asdf

asdf-erlang-plugin:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep erlang

asdf-erlang-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install erlang {{ erlang_version }}
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf list erlang | grep {{ erlang_version }}

asdf-erlang-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global erlang {{ erlang_version }}
    - runas: {{ grains['user'] }}

# install elixir
asdf-elixir-plugin:
  pkg.installed:
    - name: unzip
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf plugin list all | grep elixir

asdf-elixir-install:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf install elixir {{ elixir_version }}
    - runas: {{ grains['user'] }}
    - unless: source /opt/asdf-vm/asdf.sh; asdf list elixir | grep {{ elixir_version }}

asdf-elixir-global:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf global elixir {{ elixir_version }}
    - runas: {{ grains['user'] }}

install-package-toolchains:
  cmd.run:
    - name: source /opt/asdf-vm/asdf.sh; asdf reshim; mix local.hex --if-missing --force; mix local.rebar --force
    - runas: {{ grains['user'] }}
    - env:
      - LANG: en_US.UTF-8
