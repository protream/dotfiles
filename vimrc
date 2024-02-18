""""""""""""""""""""""""""""""""""""""""""""
" 基本设置
""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    syntax on
    set nocompatible
    set encoding=utf-8
    set termencoding=utf-8
    set laststatus=2
    set autoindent
    set autoread
    set incsearch
    set mouse-=a
endif

if has('nvim')
    " 使用easymotion的搜索高亮, 关闭nvim默认的搜索高亮
    set nohls
endif

"set hls
set nu
set rnu
set cmdheight=1
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftround
set ignorecase
set title
set cursorline
set shortmess=atI
set nowrap
set backspace=indent,eol,start

set maxmempattern=5000

inoremap jk <esc>

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" 保存时自动删除行末尾空白
autocmd BufWritePre *.* :%s/\s\+$//e
" 保存时删除末尾空行
autocmd BufWritePre *.* :%s/\($\n\s*\)\+\%$//e

"---------
" 主题设置
"---------
syntax enable
set background=dark
"set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
"let g:rehash256 = 1

set pastetoggle=<F1>

"++++++++++++++++++++++++++++++++++++++++++++
" 按键映射
"++++++++++++++++++++++++++++++++++++++++++++
"-------
" 引导键
"-------
let mapleader=','
let g:mapleader=','

"-----------
" 关闭方向键
"-----------
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

map Y y$
" Copy selected content to clipboader, only osx
vmap <leader>y :w !pbcopy<CR><CR>
nmap <leader>z <C-Z>
nmap <leader>p <C-P>

" ,/ 关闭搜索高亮
nmap <silent><leader>/ :nohls<CR>

"----------------------
" 在vim中运行Python脚本
"----------------------
" ,r for python3
nmap <leader>r :w !python3<cr>
" f5 for python2
nmap <F5> :w !python2<cr>
" f6 also for python3
nmap <F6> :w !python3<cr>

"------
" vimrc
"------
" ,mc编辑vimrc文件
nmap <leader>mc :vnew ~/.vimrc<cr>
" 重新载入vim配置
nmap <F12> :source ~/.vimrc<cr>

"--------
" session
"--------
" ,ms创建session: Make Session
nmap <leader>ms :mksession! ~/.session.vim<cr>
" ,rs恢复session: Recover Session
nmap <leader>rs :source ~/.session.vim<cr>


"++++++++++++++++++++++++++++++++++++++++++++
" 窗口管理
"++++++++++++++++++++++++++++++++++++++++++++

" 水平切分窗口
nmap <leader>nh :new<cr>
" 垂直切分窗口
nmap <leader>nv :vnew<cr>

"-------------
" 在窗口间切换
"-------------
" ,j 上
nmap <leader>j <C-W>j
" ,k 下
nmap <leader>k <C-W>k
" ,h 左
nmap <leader>h <C-W>h
" ,l 右
nmap <leader>l <C-W>l

"-------------
" 调整窗口位置
"-------------
nmap <leader>L <C-W>L
nmap <leader>K <C-W>K
nmap <leader>J <C-W>J
nmap <leader>H <C-W>H

"-------------
" 改变窗口大小
"-------------
" ,-窗口高度-1
nmap <leader>- <C-W>-
" ,+窗口高度+1
nmap <leader>+ <C-W>+
" ,<窗口宽度-1
nmap <leader>< <C-W><
" ,>窗口宽度+1
nmap <leader>> <C-W>>
" ,_使窗口最高
nmap <leader>_ <C-W>_
" ,=使窗口等宽
nmap <leader>= <C-W>=


"++++++++++++++++++++++++++++++++++++++++++++
" Tab 管理
"++++++++++++++++++++++++++++++++++++++++++++
imap ,t <ESC>:tabnew<CR>

let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


"-------------
" 快速保存退出
"-------------
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
"Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-repeat'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'posva/vim-vue'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'dyng/ctrlsf.vim'
call vundle#end()
filetype plugin indent on


"++++++++++++++++++++++++++++++++++++++++++++
" 插件设置
"++++++++++++++++++++++++++++++++++++++++++++
"--------------
" YouCompleteMe
"--------------
" 不显示Preview
set completeopt=menu
let g:ycm_key_invoke_completion = '<C-o>'
" 不用tab选择, 和UltiSnip冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
    \ 'nerdtree' : 1,
    \ 'tagbar' : 1,
    \ 'gitcommit' : 1,
    \}
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_goto_buffer_command = 'vertical-split'
nnoremap <leader>jd :YcmCompleter GoTo<CR>

"----------
" Syntastic
"----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/bin/python'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_checkers = ['splint']
let g:syntastic_html_checkers = []
let g:syntastic_python_flake8_args = '"--ignore=E501,E265,E126,E241,F403,E402,E225,E712"'
" 关闭错误显示窗口
nmap <leader>xx :lclose<cr>

"---------
" NERDTree
"---------
nmap <leader>f :NERDTreeToggle<cr>
let NERDTreeIgnore=[
    \ '^venv$',
    \ '^env$',
    \ '^ENV$',
    \ '^__pycache__$',
    \ '^.cache$',
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
    \ '^\.hg$',
    \ '^\.pytest_cache$',
    \ '^node_modules$',
    \ '\.vendor$'
    \]
" 显示隐藏文件
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"-------
" Tagbar
"-------
nmap <leader>g :TagbarToggle<cr>
" 不显示help信息
let g:tagbar_compact = 1
let g:tagbar_width = 32
let g:tagbar_autoshowtag = 0

"----------
" UltiSnips
"----------
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'Snippets']

" 编辑当前文件的snippets
map <leader>us :UltiSnipsEdit<CR>
" 水平打开snippets编辑窗口
let g:UltiSnipsEditSplit = 'vertical'

"------
" a.vim
"------
" ,a来回切换.h与.c文件
nmap <leader>a :A<cr>

"----------
" gitgutter
"----------
" 修改标识设为*
let g:gitgutter_sign_modified = '*'

"------
" CtrlP
"------
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
" 显示dotfiles
let g:ctrlp_show_hidden = 1
" 忽略
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]env|venv|\.(git|hg|svn)|node_modules|\.vendor$',
  \ 'file': '\v\.(exe|so|dll|pyc|pyo|swp|o)$',
  \ }

"------
" emmet
"------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_mode='i'
"let g:user_emmet_leader_key='<C-A>'

"-----------
" easymotion
"-----------
map ; <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
hi EasyMotionTarget2First ctermbg=none ctermfg=darkblue

"-------------
" vim markdown
"-------------
let g:vim_markdown_folding_disabled = 1

"-------
" Ag.vim
" CtrlSF.vim
"-------
nmap <leader>s :CtrlSF
" 从项目目录开始搜索
let g:ag_working_path_mode='r'
vmap <leader>w <Plug>CtrlSFVwordExec

" -------
" airline
" -------
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1

" ------------------
" rainbow parerheses
" ------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
\]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

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
