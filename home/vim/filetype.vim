au BufRead,BufNewFile *.coffee set filetype=coffee
au BufRead,BufNewFile *.coffee set expandtab
au BufRead,BufNewFile *.less set filetype=less
au BufRead,BufNewFile *.less set expandtab

autocmd BufNewFile,BufRead *.sp.erb let b:eruby_subtype = 'html'
autocmd BufNewFile,BufRead *.sp.erb set filetype=eruby.html
autocmd BufNewFile,BufRead *.rabl set filetype=ruby

autocmd BufRead,BufNewFile *.mkd set filetype=markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

function! s:Insert(text)
  mark z
  normal gg
  put! = a:text
  normal `z
endfunction

autocmd BufRead,BufNewFile *.rb command! UTF8 :call s:Insert("# coding: utf-8")
autocmd BufRead,BufNewFile *.py command! UTF8 :call s:Insert("# -*- coding: utf-8 -*-")

" http://stackoverflow.com/questions/4873292/can-i-use-both-python-and-sql-syntax-highlighting-in-the-same-file-in-vim
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

" au FileType python call TextEnableCodeSnip('sql', "'''", "'''", 'SpecialComment')
