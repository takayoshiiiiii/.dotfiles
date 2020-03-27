" vimtexでのlatexmk設定
" 書かないと日本語が死んだ
"let g:latex_latexmk_options = '-pdfdvi'
"let g:vimtex_compiler_latexmk = {'options': [ ]}
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}

" viewerの設定
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

"http://mmi.hatenablog.com/entry/2015/01/02/003517から拝借
" foldの設定
let g:vimtex_fold_parts = [
      \ "appendix",
      \ "frontmatter",
      \ "mainmatter",
      \ "backmatter",
    \ ]
let g:vimtex_fold_sections = [
      \ "part",
      \ "chapter",
      \ "section",
      \ "subsection",
      \ "subsubsection",
    \ ]
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_automatic = 1
let g:vimtex_fold_envs = 0
let g:vimtex_compiler_progname = 'nvr'
