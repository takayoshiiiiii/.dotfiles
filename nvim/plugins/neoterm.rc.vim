"" neoterm for python
let g:neoterm_autoscroll = 1
"なぜかエラー吐かれるんご
"let g:neoterm_position = 'horizontal'
"" IPythonが複数行送れないので，replを普通のPythonインタープリタに
let g:neoterm_repl_python = 'python'
tnoremap <silent> <ESC> <C-\><C-n><C-w>
nnoremap <silent> <C-l> :TREPLSendLine<cr>j0
vnoremap <silent> <C-l> V:TREPLSendSelection<cr>'>j0
nnoremap <silent> <C-a><C-a> :TREPLSendFile<cr>


" Useful maps
" Do not work!!! :(
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
