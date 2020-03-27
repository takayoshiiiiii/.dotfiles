" dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" dein.vimインストール時に指定したディレクトリをセット
" OSごとにインストール先を分けるのが吉らしい
let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
	let s:dein_dir = expand('~/.cachenvimMac/dein')
elseif OSTYPE == "Linux\n"
	let s:dein_dir = expand('~/.cachenvimLinux/dein')
elseif OSTYPE == "FreeBSD\n"
	let s:dein_dir = expand('~/.cachenvimFreeBSD/dein')
endif
" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set t_Co=256
set tags=tags
set modeline
set number
"delete key 有効
set backspace=indent,eol,start
"タイトル表示
set title
set numberwidth=5
set ruler
"tabの空白入力
set expandtab
"tab幅
set tabstop=4
"vimの自動生成tab幅
set shiftwidth=2
set softtabstop=2
set showtabline=2
"set autoindent
set noerrorbells
set laststatus=2
set history=50
set foldmethod=marker
set noswapfile
set nobackup
"コマンド表示
set showcmd
" 小文字の検索でも大文字も見つかるようにする
set ignorecase

set wildmenu
set wildmode=list,longest:full

"矢印で次の行へと飛べる
set whichwrap+=h,l,<,>,[,],b,s

"マウス入力有効
set mouse=n

"バッファをクリップボードにコピー(for OSX)
set clipboard=unnamed,unnamedplus

syntax on
set gfn=Bitstream\ Vera\ Sans\ Mono\ 12
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set encoding=utf-8
set list

set t_ut= "tmuxでvimの色が変なんになるのを防ぐ
set cursorline "カーソル行のハイライト
highlight CursorLineNr ctermbg=117
highlight CursorLine cterm=underline  ctermbg=NONE  ctermfg=NONE
set wrap "ウィンドウより長い行は畳む
set ambiwidth=double "マルチバイト文字の表示をいい感じにしてくるらしい

"またがっている一行の上下のカーソル移動を可能にする
nnoremap j gj
nnoremap k gk

"インサートモード中のctrl+a,eで、行頭行末移動
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

"インサートモードで上下左右
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"インサートモードでのdeleteをctrl+dで実現
inoremap <C-d> <C-h>

"Yでカレント一から行末までヤンク
nnoremap Y y$
