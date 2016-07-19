" Vundle Setting
"set nocompatible
"filetype off
"set rtp+=~/.vim/vundle.git/
"call vundle#rc()

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" NERDTreeを設定
NeoBundle 'scrooloose/nerdtree'

" syntax + 自動compile
NeoBundle 'kchmck/vim-coffee-script'

" js BDDツール
NeoBundle 'claco/jasmine.vim'
" indentの深さに色を付ける
NeoBundle 'nathanaelkane/vim-indent-guides'

" Gitを便利に使う
"NeoBundle 'tpope/vim-fugitive'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" Buffer Explorer
"NeoBundle 'corntrace/bufexplorer'

call neobundle#end()

" grep検索の実行後にQuickFix Listを表示する
"autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------


" PHP Manual
"autocmd FileType php :let g:ref_phpmanual_path = "/home/fumitaka/src/php-chunked-xhtml"
"autocmd FileType php :set dictionary=dict/php.dictionary
"autocmd FileType php :set omnifunc=phpcomplete#CompletePHP

" 括弧の補完
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

" コマンド補完を開始するキー
set wildchar=<tab>

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

" filetype有効化
filetype on
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.wsgi set filetype=python

" 現在行の下線処理
"set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
" for GUI
highlight CursorLine gui=underline guifg=NONE guibg=NONE
" cursorline の表示切り替え: 遅いから
nnoremap [cline] <Nop>
nmap <Space>l [cline]
nnoremap <silent> [cline]l :set cursorline!<CR>

"整形処理
nnoremap == gg=G''

":->:
nnoremap ; :

"Manual save File & Session
nnoremap AA :w <bar> mks!<CR>

" Shift+ee do ESC
inoremap <silent> ~~ <ESC>

"increment & decrement
nnoremap <C-j> <C-a>
nnoremap <C-k> <C-x>

" ctag
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"vimrc
"autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"nmap ,erc :edit ~/.vimrc<CR>
"nmap ,rrc :so ~/.vimrc<CR>


set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" 基本設定
set number
set numberwidth=6
set ruler
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set showmatch
set backspace=2
set ai
set laststatus=2
syntax on

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" バッファ関連
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>
nmap bb :ls<CR>:buf 


"neNERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT

let NERDTreeWinSize=56

"bufexplorer
"nnoremap <silent><C-w> :BufExplorer<CR>

" 大量のGem死ね
"let g:ruby_path = "" 

" Formatter
" http://vim.wikia.com/wiki/Cleanup_your_HTML
"command Thtml execute ":%!tidy -q -i -a --show-errors 0"
"command Txml execute ":%!tidy -q -i -a --show-errors 0 -xml"

" 候補のポップアップ中にエンターを入力したときに、改行されるようにする。
"inoremap <expr> <CR> (pumvisible()) ? "\<C-y>\<CR>" : "\<CR>"
