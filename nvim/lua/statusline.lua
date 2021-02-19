local stl = {
  ' %M',
  ' %y',
  ' %r',
  ' %{pathshorten(expand("%:p"))}',
  ' %{FugitiveStatusline()}',
  '%=',
  ' %c:%l/%L'
}

vim.o.statusline = table.concat(stl)
