set nocompatible

"使用英文菜单
set langmenu=en_US
"source $VIMRUNTIME/delmenu.vim
let $LANG = 'en_US'
"source $VIMRUNTIME/menu.vim

set ignorecase smartcase

"Bundle插件管理
filetype off
if has("win32")
se rtp+=c:/Vim/bundle/vundle/
else
set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

"支撑库
Bundle 'gmarik/vundle'
Bundle 'L9'

"文件编码识别
Bundle 'FencView.vim'

"文件检索
"Bundle 'FuzzyFinder'

"切换.h/.cpp
Bundle 'a.vim'

"文件编辑历史记录
Bundle 'mru.vim'

"Tag列表
Bundle 'taglist.vim'

"文件目录 NERDTree
"Bundle 'The-NERD-tree'
Bundle 'scrooloose/nerdtree'
"{
map <F8> :NERDTreeToggle<CR>
"}
Bundle 'jistr/vim-nerdtree-tabs'


"注释代码
"usage:
"n\cc : 为光标以下 n 行添加注释
"n\cu : 为光标以下 n 行取消注释
""+gp"
Bundle 'The-NERD-Commenter'

Bundle 'ctrlp.vim'

"自动闭合括号
"Bundle 'AutoClose'

"在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'

"自动补全
Bundle 'Valloric/YouCompleteMe'

Bundle 'UltiSnips'

"代码自动提示
"Bundle 'AutoComplPop'
"{
"php
"if !exists('g:AutoComplPop_Behavior')
"let g:AutoComplPop_Behavior = {}
"let g:AutoComplPop_Behavior['php'] = []
"call add(g:AutoComplPop_Behavior['php'], {
"\'command' : '\\',
"\ 'pattern' : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
"\ 'repeat' : 0,
"\})
"endif
"}

"配色包
Bundle 'Colour-Sampler-Pack'

"For Web
Bundle '2072/PHP-Indenting-for-VIm'
Bundle 'pangloss/vim-javascript'
Bundle 'nono/jquery.vim'
Bundle 'JSON.vim'

"html快速输入
"Bundle 'ZenCoding.vim'

Bundle 'yueyoum/vim-linemovement'
"{
let g:linemovement_up="<c-Up>"
let g:linemovement_down="<c-Down>"
"}

Bundle 'Lokaltog/vim-powerline'
"{
"set guifont=Menlo\ for\ Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme='solarized256'
set t_Co=256
"}


filetype plugin indent on
"
" Brief help
" :BundleList          - list configured bundlesColorSamplerPack
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"--------------------------------

set langmenu=gbk
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030

"控制台乱码
language messages zh_CN.utf-8

syntax enable
syntax on

"启动鼠标功能
set mouse=a                 

"显示行号
set nu

set paste
" 高亮当前行
set cursorline

" 查找结果高亮度显示
set hlsearch
" 输入字符串就显示匹配点
set incsearch

"配色方案
"colorscheme Candycode
"colorscheme spring
colorscheme molokai

set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0

" tab参数设置
set expandtab    			" 使用空格代替tab
set tabstop=4
set shiftwidth=4                        " indents of 8
set cindent shiftwidth=4
set autoindent shiftwidth=4
set cindent      			" C语言方式缩进
set autoindent smartindent              " turn on auto/smart indenting
set smarttab                            " make <tab> and <backspace> smarter
set backspace=eol,start,indent          " allow backspacing over indent, eol, & sta

"缺省不产生备份文件 
set nobackup
set noswapfile

"隐藏菜单
"set guioptions-=m
"隐藏工具栏
set guioptions-=T

"For Windows 
if has("win32")
"启动最大化
au GUIEnter * simalt ~x

endif

"记录历史文件的位置
"let MRU_File=$VIM.'/Data/mru_files.txt' 
"记录的条数
let MRU_Max_Entries=50  
"分割窗口的大小
let MRU_Window_Height=10 
"选择文件后打开此窗口自动关闭
let MRU_Auto_Close=1 

"CTags setting
set tags+=./tags
" 自动生成tags
function! MakeTags()	
	if has("win32")	
        execute(":cs kill 0")
		execute(":!start cmd /c ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")
		execute(":!start cmd /c cscope -Rb")
    else
		execute(":!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")
		execute(":!find . -name \"*.h\" -o -name \"*.c\" -o -name \"*.py\" > cscope.files")
		execute(":!cscope -b")
	endif
	"execute (":UpdateTypesFileOnly")
	exec(":TlistUpdate")
	exec(":cs reset")
    exec(":cs add cscope.out")
endfunction

map <C-F9> :call MakeTags()<CR>
"zc 折叠
"zC 对所在范围内所有嵌套的折叠点进行折叠
"zo 展开折叠
"zO 对所在范围内所有嵌套的折叠点展开
"zf　创建折叠，比如在marker方式下：
        "zf56G，创建从当前行起到56行的代码折叠；
        "10zf或10zf+或zf10↓，创建从当前行起到后10行的代码折叠。
        "10zf-或zf10↑，创建从当前行起到之前10行的代码折叠。
        "在括号处zf%，创建从当前行起到对应的匹配的括号上去（（），{}，[]，<>等）。
set foldmethod=marker
"\cc  注释当前行
"\cu  取消注释
