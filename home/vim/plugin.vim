if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/bundle/dein.vim/

call dein#begin(expand('~/.vim/bundle/'))

call dein#add('tpope/vim-fugitive')
call dein#add('kien/ctrlp.vim')
call dein#add('ack.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('kchmck/vim-coffee-script')
call dein#add('mattn/emmet-vim')
call dein#add('deris/parajump')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('cocoa.vim')
call dein#add('quickrun.vim')
call dein#add('Markdown')
call dein#add('groenewege/vim-less')
call dein#add('fugitive.vim')
call dein#add('tpope/vim-rails')
call dein#add('EnhCommentify.vim')
call dein#add('wombat256.vim')
call dein#add('kana/vim-fakeclip.git')
call dein#add('L9')
call dein#add('FuzzyFinder')
call dein#add('jpalardy/vim-slime.git')
call dein#add('othree/yajs.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('moll/vim-node')
call dein#add('marijnh/tern_for_vim.git')
call dein#add('othree/html5.vim.git')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('justmao945/vim-clang')
call dein#add('airblade/vim-gitgutter')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('LeafCage/yankround.vim')
call dein#add('tpope/vim-surround')
call dein#add('sjl/gundo.vim')
call dein#add('davidhalter/jedi-vim')
call dein#add('Raimondi/delimitMate')
call dein#add('sjl/gundo.vim')
call dein#add('honza/vim-snippets')
call dein#add('SirVer/ultisnips')
call dein#add('python_match.vim')
call dein#add('hynek/vim-python-pep8-indent')
call dein#add('tell-k/vim-autopep8')
call dein#add('scrooloose/syntastic.git')
call dein#add('jtratner/vim-flavored-markdown')
call dein#add('derekwyatt/vim-scala')
call dein#add('fakeclip')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('SQLUtilities')
call dein#add('Align')

call dein#end()

filetype plugin indent on
syntax enable

"Commentify
let g:EnhCommentifyRespectIndent = "yes"

"FufFile
command! FF :FufFile

"Git Gutter
nmap gi <Plug>GitGutterPrevHunk
nmap gk <Plug>GitGutterNextHunk
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
let g:slime_python_ipython = 0
let g:slime_default_config = {"socket_name": "default", "target_pane": "0.1"}

"Ctrlp
let g:ctrlp_use_migemo = 1

"UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

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
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_remove_include_errors=1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_javascript_checkers = ['eslint']

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
let g:neocomplete#force_omni_input_patterns.python='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

let g:clang_complete_auto=0
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
      \ 'php' : $HOME.'/.vim/dict/php.dict',
      \ }

" clang
let g:clang_auto=0
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

autocmd! FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal shiftwidth=4
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

command! -nargs=* ES NeoSnippetEdit <args>
command! CacheSyntax neocompleteCachingSyntax

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" SQL
vmap sf <Plug>SQLUFormatter<CR>

"JSX
let g:jsx_ext_required = 0
