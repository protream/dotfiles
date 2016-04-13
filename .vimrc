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
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set title
set shortmess=atI
set encoding=utf-8
set helplang=cn
set showcmd


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
let mapleader=','
let g:mapleader=','

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map Y y$

" ,w 快速保存
nmap <leader>w :wall!<cr>
" ,q 快速退出
nmap <leader>q :q!<cr>
" ,c 快速关闭窗口
nmap <leader>c :close<cr>

" ,/ 关闭代码高亮
noremap <silent><leader>/ :nohls<CR>

" 直接在vim中执行Python程序
" ,r for python3
nnoremap <leader>r :w !python3<cr>
" f5 for python2
nnoremap <F5> :w !python2<cr>
" f6 also for python3
nnoremap <F6> :w !python3<cr>

"重新载入vim配置
nnoremap <F12> :source ~/.vimrc<cr>

" 创建session
nnoremap <leader>ss :mksession! ~/.session.vim<cr>
" 恢复session
nnoremap <leader>s :source ~/.session.vim<cr>


"++++++++++++++++++++++++++++++++++++++++++++
" 窗口管理
"++++++++++++++++++++++++++++++++++++++++++++
" 在窗口间切换
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l

" 调整窗口位置
nmap <leader>L <C-W>L
nmap <leader>K <C-W>K
nmap <leader>J <C-W>J
nmap <leader>H <C-W>H

" ,z 保存所有窗口并退出
nmap <leader>z :wqall<cr>
nmap <leader>o :only<cr>


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
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/a.vim'
call vundle#end()
filetype plugin indent on


"++++++++++++++++++++++++++++++++++++++++++++
" 插件设置
"++++++++++++++++++++++++++++++++++++++++++++
" YouCompleteMe
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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'pyflakes']
nmap <F10> :lopen<cr>
nmap <leader>x :lclose<cr>

" NERDTree
nmap <leader>f :NERDTreeToggle<cr>
let NERDTreeIgnore=[
    \ '\.pyc$',
    \ '\.pyo$',
    \ '\.obj$',
    \ '\.o$',
    \ '\.so$',
    \ '\.out$',
    \ '\.egg$',
    \ '^\.git$',
    \ '^\.svn$',
    \ '^\.hg$'
    \]
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let NERDTreeMinimalUI = 1

" Tagbar
nmap <leader>t :TagbarToggle<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'Snippets']
map <leader>us :UltiSnipsEdit<CR>

" Trailling Whitespace
nmap <leader><Space> :FixWhitespace<cr>

" a.vim
nmap <leader>a :A<cr>


"++++++++++++++++++++++++++++++++++++++++++++
" Gvim设置
"++++++++++++++++++++++++++++++++++++++++++++
if has("gui_running")
    set guifont="Monospace":h12
    set guioptions-=T
    set guioptions-=e
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=m
    set t_Co=256
    set lines=999
    set columns=999
endif
