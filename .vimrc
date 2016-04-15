"++++++++++++++++++++++++++++++++++++++++++++
" 基本设置
"++++++++++++++++++++++++++++++++++++++++++++
syntax on
set number
set nocompatible
set cmdheight=1
set autoindent
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set autoread
set incsearch
set ignorecase
set laststatus=2
set title
set shortmess=atI
set encoding=utf-8
set helplang=cn
set showcmd

" 使用easymotion高亮搜索, 关闭这个
"set hlsearch

"++++++++++++++++++++++++++++++++++++++++++++
" 主题设置
"++++++++++++++++++++++++++++++++++++++++++++
set background="dark"
set t_Co=256
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1


"++++++++++++++++++++++++++++++++++++++++++++
" 按键映射
"++++++++++++++++++++++++++++++++++++++++++++
" 引导键: ,
let mapleader=','
let g:mapleader=','

" 关闭方向键
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map Y y$

" ,/ 关闭搜索高亮
nmap <silent><leader>/ :nohls<CR>

" 直接在vim中执行Python程序
" ,r for python3
nmap <leader>r :w !python3<cr>
" f5 for python2
nmap <F5> :w !python2<cr>
" f6 also for python3
nmap <F6> :w !python3<cr>

" ,mc编辑vimrc文件
nmap <leader>mc :e ~/.vimrc<cr>
" 重新载入vim配置
nmap <F12> :source ~/.vimrc<cr>

" ,ms创建session: Make Session
nmap <leader>ms :mksession! ~/.session.vim<cr>
" ,rs恢复session: Recover Session
nmap <leader>rs :source ~/.session.vim<cr>


"++++++++++++++++++++++++++++++++++++++++++++
" 窗口管理
"++++++++++++++++++++++++++++++++++++++++++++
" 在窗口间切换
" ,j 上
nmap <leader>j <C-W>j
" ,k 下
nmap <leader>k <C-W>k
" ,h 左
nmap <leader>h <C-W>h
" ,l 右
nmap <leader>l <C-W>l

" 调整窗口位置
nmap <leader>L <C-W>L
nmap <leader>K <C-W>K
nmap <leader>J <C-W>J
nmap <leader>H <C-W>H

" ,w 快速保存
nmap <leader>w :w<cr>
" ,wa 保存所有窗口
nmap <leader>wa :wall<cr>
" ,q 强制退出当前窗口
nmap <leader>q :q!<cr>
" ,c 快速关闭窗口
nmap <leader>c :close<cr>


" ,wz 保存所有窗口并退出
nmap <leader>wz :wqall<cr>
" ,wo
nmap <leader>wo :only<cr>


"++++++++++++++++++++++++++++++++++++++++++++
" 插件管理
"++++++++++++++++++++++++++++++++++++++++++++
syntax enable
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
call vundle#end()
filetype plugin indent on


"++++++++++++++++++++++++++++++++++++++++++++
" 插件设置
"++++++++++++++++++++++++++++++++++++++++++++
"--------------
" YouCompleteMe
"--------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
    \ 'nerdtree' : 1,
    \ 'tagbar' : 1,
    \ 'gitcommit' : 1,
    \ 'text' : 1,
    \ 'markdown' : 1,
    \}
nnoremap <leader>jd :YcmCompleter GoTo<CR>

"----------
" Syntastic
"----------
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['flake8']
" 忽略F401:引入未使用, E501: 超过79字符
let g:syntastic_python_flake8_args = '"--ignore=F401,E501"'
" 关闭错误显示窗口
nmap <leader>xx :lclose<cr>

"---------
" NERDTree
"---------
nmap <leader>f :NERDTreeToggle<cr>
let NERDTreeIgnore=[
    \ '\.pyc$',
    \ '\.pyo$',
    \ '\.obj$',
    \ '\.o$',
    \ '\.so$',
    \ '\.out$',
    \ '\.egg$',
    \ '\.swp$',
    \ '^\.git$',
    \ '^\.svn$',
    \ '^\.hg$'
    \]
" 显示隐藏文件
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1

"-------
" Tagbar
"-------
nmap <leader>t :TagbarToggle<cr>
" 不显示help信息
let g:tagbar_compact = 1
let g:tagbar_width = 32

"----------
" UltiSnips
"----------
let g:UltiSnipsExpandTrigger = '<C-h>'
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'Snippets']

" 编辑当前文件的snippets
map <leader>us :UltiSnipsEdit<CR>
" 水平打开snippets编辑窗口
let g:UltiSnipsEditSplit = 'horizontal'

"---------------------
" Trailling Whitespace
"---------------------
nmap <leader><Space> :FixWhitespace<cr>

"------
" a.vim
"------
" ,a来回切换.h与.c文件
nmap <leader>a :A<cr>


"--------------------
" NERDTree git plugin
"--------------------
" 默认的标识依次是: ✹ ✚ ✭ ➜ ═ ✖ ✗ ✔︎ ?
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "X",
    \ "Dirty"     : "D",
    \ "Clean"     : "C",
    \ "Unknown"   : "?"
    \ }

"----------
" gitgutter
"----------
" 修改标识设为*
let g:gitgutter_sign_modified = '*'

"------
" CtrlP
"------
" 显示dotfiles
let g:ctrlp_show_hidden = 1
" 忽略
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.swp/*

"------
" emmet
"------
let g:user_emmet_mode='i'
"let g:user_emmet_leader_key='<C-M>'


"-----------
" easymotion
"-----------
map ; <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"-------------
" vim markdown
"-------------
let g:vim_markdown_folding_disabled = 1


"++++++++++++++++++++++++++++++++++++++++++++
" Gvim设置
"++++++++++++++++++++++++++++++++++++++++++++
if has("gui_running")
    set guifont="Monospace":h12

    " 关闭工具栏, 滚动条等
    set guioptions-=T
    set guioptions-=e
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m

    set t_Co=256

    " 最大化打开
    set lines=999
    set columns=999
endif
