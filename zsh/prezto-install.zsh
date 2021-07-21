#!/bin/zsh
set -xe

git clone --recursive https://github.com/sorin-ionescu/prezto.git /home/jared/.zprezto

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


