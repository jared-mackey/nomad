#!/bin/zsh
set -xe

cd /home/jared/.zprezto
git submodule sync --recursive
git submodule update --init --recursive

