nnoremap <buffer> <F4> <cmd>ClangdSwitchSourceHeader<cr>
packadd termdebug
setlocal cindent
setlocal cino=j1,(0,ws,Ws,N+s,t0,g0,+0
let b:undo_ftplugin='setlocal cindent< cino<'
