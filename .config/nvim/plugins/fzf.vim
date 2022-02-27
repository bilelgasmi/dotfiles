Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

let g:fzf_layout = {'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5 }}
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

" Customise the files command to use rg which respects .gitignore files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#run(fzf#wrap('files', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden' }), <bang>0))

" Add an AllFiles variation that ignores .gitignore files
command! -bang -nargs=? -complete=dir AllFiles
    \ call fzf#run(fzf#wrap('allfiles', fzf#vim#with_preview({ 'dir': <q-args>, 'sink': 'e', 'source': 'rg --files --hidden --no-ignore' }), <bang>0))

" ripgrep
nnoremap <leader>a :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>


" shortcut for :GitFiles
nmap <leader><leader> :Files<cr>
nmap <leader>af :AllFiles<cr>
nmap <leader>B :Buffers<cr>
nmap <leader>h :History<cr>

nmap <leader>r :Rg<cr>
nmap <leader>rr :exec "Rg ".expand("<cword>")<cr>
nmap <leader>R :Rg<space>

nmap <leader>gb :GBranches<cr>
