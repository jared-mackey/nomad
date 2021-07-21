" Elixir setup
nnoremap <leader>md :AsyncRun fswatch -o lib \| xargs -n1 -I {} mix docs & live-server doc && fg<CR>
