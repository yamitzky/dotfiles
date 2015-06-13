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

autocmd BufRead,BufNewFile *.rb command! UTF8 :normal ggO# coding: utf-8
autocmd BufRead,BufNewFile *.py command! UTF8 :normal ggO# -*- coding: utf-8 -*-
