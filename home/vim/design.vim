if has('termguicolors')
  set termguicolors
endif
hi Normal ctermbg=233
set statusline=%f\ %m%r%h%w\ [FMT=%{&ff}]\ [ENC=%{&fileencoding}]\ [TYP=%Y]%=(Line:%l/%L\ Col:%c)\
try
  colorscheme wombat256mod
catch
  colorscheme default
endtry
