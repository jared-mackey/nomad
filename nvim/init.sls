neovim:
  pkg.installed:
    - name: neovim

neovim-config:
  file.recurse:
    - name: /home/{{ grains['user'] }}/.config/nvim
    - source: salt://nvim/nvim
    - user: {{ grains['user'] }}
    - clean: true
  cmd.run:
    - name: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    - runas: {{ grains['user'] }}

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: /home/{{ grains['user'] }}/.local/share/nvim/site/pack/packager/opt/packer.nvim
    - user: {{ grains['user'] }}
