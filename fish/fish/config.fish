################################################################################
# BASES
################################################################################
set -gx XDG_CODE_HOME $HOME/dev/private
set -gx XDG_CONFIG_HOME $HOME/.config

fish_add_path -a -g ~/.local/bin

################################################################################
# TERMINAL
################################################################################
set -gx GPG_TTY (tty)
set -gx EDITOR nvim
set -gx MANPAGER nvim +Man!

################################################################################
# K8s
################################################################################
alias kctx="kubectx"
alias kns="kubens"
alias k="kubectl"
alias kgp="kubectl get pods"
alias tshproxykube="tsh proxy kube -p 8833 &"
alias consul-forward="kubectl port-forward -n kv consul-server-0 8500:8500 &; sleep 2; xdg-open http://localhost:8500; fg"
set -xg KUBECONFIG /home/jared/.tsh/keys/teleport.yendostaging.com/jared-kube/teleport.yendostaging.com/localproxy-8833-kubeconfig
set -xg TELEPORT_ADD_KEYS_TO_AGENT no

################################################################################
# Python
################################################################################
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

################################################################################
# Elixir
################################################################################
# Enables history in IEx
set -xg ERL_AFLAGS "-kernel shell_history enabled"
# For compiling erlang
set -xg KERL_CONFIGURE_OPTIONS "--disable-debug --without-javac"
# Enable erlang docs for IEx help function
set -xg KERL_BUILD_DOCS yes

alias credo="mix credo --strict"

set -xg ELIXIR_LS_DIR $XDG_CODE_HOME/elixir-ls

################################################################################
# Android
################################################################################
set -xg ANDROID_HOME $HOME/Android/Sdk
fish_add_path -a -g $ANDROID_HOME/platform-tools/

################################################################################
# NOMAD
################################################################################
alias nomad='sudo salt-call state.apply'

################################################################################
# Flutter / Dart
################################################################################
fish_add_path -a -g $HOME/dev/yendo/flutter/bin
export ANDROID_HOME="$HOME/Android"   # this might be different for you, or android studio does it automatically. Depends!
export ANDROID_SDK_ROOT=$ANDROID_HOME/Sdk
fish_add_path -a -g $ANDROID_SDK_ROOT/emulator
fish_add_path -a -g $ANDROID_SDK_ROOT/platform-tools
fish_add_path -a -g $ANDROID_SDK_ROOT/cmdline-tools/latest/bin

################################################################################
# RUST
################################################################################
fish_add_path -a -g ~/.cargo/bin

################################################################################
# Go
################################################################################
set -xg GOBIN "$HOME/.local/bin/"
# set GO max procs to number of cores - 20% to avoid overloading the system
set -xg GOMAXPROCS (nproc | awk '{print int($1 * 0.8)}')
set -xg GOMEMLIMIT '2GiB'
# move go cache to a ramdisk 
# Set   GOFLAGS to use 25% of available cores for parallel builds, to avoid overloading the system
set -xg GOFLAGS (nproc | awk '{print "-p=" int($1 * 0.25)}')
alias go-lint='golangci-lint run --new-from-rev (git rev-parse origin/staging)'
fish_add_path -a -g $HOME/.rover/bin

################################################################################
# Docker aliases
################################################################################
alias docker-compose="docker compose"

################################################################################
# ASDF
################################################################################
set -xg ASDF_DATA_DIR "$HOME/.asdf"
fish_add_path -p -g $ASDF_DATA_DIR/shims

################################################################################
# Rust alternatives
################################################################################
alias cat="bat"
alias ll='exa -lha --group-directories-first --icons'
alias ls="exa"

################################################################################
# Zoxide
################################################################################
zoxide init fish | source

################################################################################
# Direnv
################################################################################
direnv hook fish | source


################################################################################
# Kitty
################################################################################
function copy_term_info_ssh
  infocmp -a xterm-kitty | ssh $argv tic -x -o \~/.terminfo /dev/stdin
end

################################################################################
# Starship
################################################################################
starship init fish | source

remuda completions fish | source
