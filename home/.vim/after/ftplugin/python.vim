function! _EscapeText_python(text)
  if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1
    return "%cpaste\n".a:text."--\n"
  else
    let no_empty_lines = substitute(a:text, '\n\s*\ze\n', "", "g")
    let stripped = substitute(substitute(a:text, '^\s*', '', ''), '\s*$', '', '')
    if stripped[:3] == 'for ' && stripped[-2:-2] == ':'
      return  substitute(stripped[4:-3], ' in ', ' = iter(', '') . ').next()'
    else
      return substitute(no_empty_lines, "\n", "", "g")
    end
  end
endfunction
