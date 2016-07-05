colorscheme pablo
" set tabstop=4
" set autoindent
" set expandtab
" set shiftwidth=4
set number
set clipboard=unnamedplus
""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
" function! ZenkakuSpace()
"     highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
" endfunction
"
" if has('syntax')
"     augroup ZenkakuSpace
"         autocmd!
"         autocmd ColorScheme * call ZenkakuSpace()
"         autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
"     augroup END
"     call ZenkakuSpace()
" endif
""""""""""""""""""""""""""""""

:map <c-h> <Left>
:map <c-j> <Up>
:map <c-k> <Down>
:map <c-l> <Right>
:imap <c-h> <Left>
:imap <c-j> <Up>
:imap <c-k> <Down>
:imap <c-l> <Right>

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" " ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" " ステータス行に現在のgitブランチを表示する
" set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" " バックアップディレクトリの指定(でもバックアップは使ってない)
" set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" " 暗い背景色に合わせた配色にする
" set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
" set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=4
" Vimが挿入するインデントの幅
set shiftwidth=4
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
 " カラースキーマの指定
"colorscheme custom
" colorscheme pablo
" colorscheme desert
" colorscheme elflord
" colorscheme evening
" colorscheme darkblue
" colorscheme delek
" colorscheme slate
" colorscheme zellner
" .vim文字色補足
" highlight Comment ctermfg=2 
" highlight Constant ctermfg=5 
" highlight Special ctermfg=3
" highlight PreProc ctermfg=5
"
" 行番号の色
highlight LineNr ctermfg=darkgreen
""""""""""""""""""""""""""""""

"monokai
" syntax enable
" colorscheme monokai

"molokai
" syntax on
" colorscheme molokai
" set t_Co=256
nnoremap <silent><C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" プラグインのセットアップ
"""""""""""""""""""""""""""""""
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

"-------------ここに入れたいプラグインを書いていく---------


"---tcomment---
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
"コマンドで括弧つけ
NeoBundle 'tpope/vim-surround'
"indentline
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>


"-------------ここまで-----------------------------------

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""

