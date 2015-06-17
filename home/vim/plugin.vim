if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
if has('lua')
  NeoBundle 'Shougo/neocomplete.git'
  NeoBundle "Shougo/neocomplcache-rsense.git"
endif
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'deris/parajump'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'cocoa.vim'
NeoBundle 'quickrun.vim'
NeoBundle 'Markdown'
NeoBundle 'groenewege/vim-less'
NeoBundle 'fugitive.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'EnhCommentify.vim'
NeoBundle 'Wombat'
NeoBundle 'michalbachowski/vim-wombat256mod'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'jpalardy/vim-slime.git'
NeoBundle 'marijnh/tern_for_vim.git'
NeoBundle 'othree/html5.vim.git'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle "Rip-Rip/clang_complete.git"
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'python_match.vim'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'tell-k/vim-autopep8'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'fakeclip'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"Commentify
let g:EnhCommentifyRespectIndent = "yes"

"FufFile
command! FF :FufFile

"Git Gutter
nmap gh <Plug>GitGutterNextHunk
nmap gH <Plug>GitGutterPrevHunk
command! G :GitGutterToggle
let g:gitgutter_diff_args = '-w'

let g:indent_guids_enable_on_vim_startup = 1
let g:indent_guids_auto_colors=0
let g:indent_guids_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"NerdTree
let NERDTreeMapOpenSplit="h"
let NERDTreeMapToggleHidden="H"
let NERDTreeMapJumpFirstChild="B"

"vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "0.1"}

"Ctrlp
let g:ctrlp_use_migemo = 1

"UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" EasyMotion
let g:EasyMotion_leader_key = '<Space><Space>'

"jedi
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#documentation_command = ""

autocmd FileType python map <D-S-R> :call jedi#rename()<CR>

"autopep8
autocmd FileType python map <buffer> <F3> :call Autopep8()<CR>

"ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" github-flavored-md
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

let g:user_emmet_leader_key='<C-Z>'
autocmd FileType html,css EmmetInstall

"syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

""""""""""""""""""""""""""""""""
" neocomplete
""""""""""""""""""""""""""""""""
set completeopt-=preview

let g:neocomplete#enable_at_startup = 1
let g:rsenseHome = "~/sources/rsense-0.3"
let g:neocomplete#sources#rsense#home_directory = g:rsenseHome
let g:neocomplete#enable_smart_case = 1
let g:neocomplete_force_overwrite_completefunc=1
let g:neocomplete#force_omni_input_patterns = {}
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|::'
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:clang_complete_auto=0
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ }

autocmd! FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal shiftwidth=4
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

command! -nargs=* ES NeoSnippetEdit <args>
command! CacheSyntax neocompleteCachingSyntax

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
