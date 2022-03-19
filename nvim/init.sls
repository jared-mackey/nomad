neovim:
  pkg.installed:
    - name: neovim

neovim-config:
  file.recurse:
    - name: /home/jared/.config/nvim
    - source: salt://nvim/nvim
    - user: jared
    - clean: true
  cmd.run:
    - name: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
    - runas: jared

vim-packer:
  git.cloned:
    - name: https://github.com/wbthomason/packer.nvim
    - target: /home/jared/.local/share/nvim/site/pack/packager/opt/packer.nvim
    - user: jared
