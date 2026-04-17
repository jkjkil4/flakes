set number relativenumber
nnoremap <Esc> :nohlsearch<CR>

set ts=4 sw=4 et
augroup indent_rules
    autocmd!
    autocmd FileType python setlocal ts=4 sw=4 et
    autocmd FileType nix setlocal ts=2 sw=2 et
    autocmd FileType lua setlocal ts=2 sw=2 et
augroup END

set mouse=

