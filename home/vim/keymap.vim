imap <C-e> <C-x><C-o>
inoremap <C-c> <ESC>
map Q gq
inoremap <C-U> <C-G>u<C-U>

" cursor move
inoremap <C-L> <Right>

noremap <Down> gj
noremap <Up> gk

noremap h i
noremap <S-H> <S-I>
noremap i <Up>
noremap j <Left>
noremap k <Down>
map K }
map L w
map I {
nnoremap c, vf,c
nnoremap , f,
nnoremap <C-w>i <C-w>k
nnoremap <C-w>j <C-w>h
nnoremap <C-w>k <C-w>j

vnoremap * "zy:let @/ = @z<CR>n

" completion
nnoremap T gT
nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-i> <C-w>k
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
inoremap <C-H> {<Enter>}<Esc>V=O
inoremap <C-A> [<Enter>]<Esc>O

command! Delete :%s/^  *$/

cmap w!! w !sudo tee > /dev/null %

function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

function! s:import()
  split
  normal gg
endfunction
command! Import :call s:import()

nnoremap /  /\v
