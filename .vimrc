"************************************************
"# Author: lirise(alfangj@126.com)
"# Create Time: 2021-02-07 18:05:53
"# Modified Time: 2021-02-26 22:31:46 
"************************************************

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
filetype plugin indent on
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=2          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
""""""""""""""""""""""""""""""""""""
" 按F2打开关闭行号                    
""""""""""""""""""""""""""""""""""""
map <silent> <F2> :call SetLineNumber()<CR>
func! SetLineNumber()
    if &number!=0
       exec "set nonumber"
   else
        exec "set number"
    endif
endfunc
"""""""""""""""""""""""""""""""""""" 
" 鼠标支持
"""""""""""""""""""""""""""""""""""" 
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi         "设置为nvi时可以鼠标定位,但是不能用右键的功能"   
  endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer相关设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按Alt+<F4>关闭当前Buffer
""""""""""""""""""""""""""""""""""""
map <silent> <a-F4> :call CloseCurrentBuffer()<CR>
func! CloseCurrentBuffer()
        silent! execute " w "
        let s:CurrentBufferNumber = bufnr("%")
        silent! execute " bn "
        let s:NextBufferNumber = bufnr("%")
        if s:CurrentBufferNumber != s:NextBufferNumber
            silent! execute " bdelete " . s:CurrentBufferNumber
        endif
endfunc
""""""""""""""""""""""""""""""""""""
"按Ctrl+Alt+<F4>删除除当前Buffer以外的所有Buffer
""""""""""""""""""""""""""""""""""""
map <silent> <c-a-F4> :call CloseOthersBuffer()<CR>
func! CloseOthersBuffer() 
    let s:CurrentBufferNumber = bufnr("%") 
  for i in range(1,bufnr("$")) 
    if buflisted(i) 
     if i!=s:CurrentBufferNumber
      execute("bdelete ".i)
     endif
    endif 
  endfor
endfunc
""""""""""""""""""""""""""""""""""""
"按<tab>键进入下一个Buffer
""""""""""""""""""""""""""""""""""""
nmap <tab> :bn<cr>
""""""""""""""""""""""""""""""""""""
"自动只显示一个Buffer
""""""""""""""""""""""""""""""""""""
map <silent> <a-F2> :only<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题相关设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按F9随机切换ColorsCheme
"""""""""""""""""""""""""""""""""""" 
map <silent> <F9> :call ChangeColorsCheme()<CR>   
func! ChangeColorsCheme()
    silent! execute "!sh ~/.vim/colorstheme/GetColorsCheme.sh"
    let s:UnNamed = getreg()
    silent! execute "colorscheme ".s:UnNamed
endfunc           
"""""""""""""""""""""""""""""""""""" 
"按Alt+F9删除当前ColorsCheme主题
"""""""""""""""""""""""""""""""""""" 
map <silent> <a-F9> :call DeleteColorsCheme()<CR>   
func! DeleteColorsCheme()
    silent! execute "!sh ~/.vim/colorstheme/DeleteColorsCheme.sh"
endfunc           
"""""""""""""""""""""""""""""""""""" 
"按Ctrl+F9显示当前ColorsCheme主题名
""""""""""""""""""""""""""""""""""""
map <silent> <c-F9> :colorscheme<CR>
"""""""""""""""""""""""""""""""""""" 
"按F10切换Airline主题
"""""""""""""""""""""""""""""""""""" 
map <silent> <F10> :call ChangeAirLineTheme()<CR>   
func! ChangeAirLineTheme()
    silent! execute "!sh ~/.vim/colorstheme/GetAirlineTheme.sh"
    let s:UnNamed = getreg()
    silent! execute "AirlineTheme ".s:UnNamed
endfunc           
"""""""""""""""""""""""""""""""""""" 
"按Alt+F10删除AirLineTheme主题
"""""""""""""""""""""""""""""""""""" 
map <silent> <a-F10> :call DeleteAirLineTheme()<CR>   
func! DeleteAirLineTheme()
    silent! execute "!sh ~/.vim/colorstheme/DeleteAirLineTheme.sh"
endfunc
"""""""""""""""""""""""""""""""""""" 
"按Ctrl+F10显示当前AirlineTheme主题名
""""""""""""""""""""""""""""""""""""
map <silent> <c-F10> :AirlineTheme<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编译调试相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"C，C++ 等按F5编译运行
""""""""""""""""""""""""""""""""""""
map <silent> <F5> :call CompileProgram()<CR>
 func! CompileProgram()
    if &filetype == 'c'
        exec "w"
        exec "!clang % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "w"
        exec "!clang % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "w"
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        exec "w"
        exec "!chmod 0755 ./%"
        exec "!./%"
    elseif &filetype == 'python'
        exec "w"
        exec "!time python3 %"
    endif
 endfunc
""""""""""""""""""""""""""""""""""""
" C,C++按F8调试
""""""""""""""""""""""""""""""""""""
map <silent> <F8> :call DebugProgram()<CR>
func! DebugProgram()
    if &filetype == 'c'
       exec "w"
       exec "!gcc % -g -o %<"
       exec "!lldb ./%<"
   elseif &filetype == 'cpp'
       exec "w"
       exec "!g++ % -g -o %<"
       exec "!lldb ./%<"
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=10        " 设置向右滚动字符数
set scrolloff=7          " 代码最后保留7行，否则滚动
set nofoldenable         " 禁用折叠代码
set foldmethod=syntax   " 设置基于语法进行代码折叠
set formatoptions+=mM    " 在断行、合并(join)行时，针对多字节字符（比如中文）的优化处理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set wildmode=list:longest "设置补全方式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch             " 高亮显示搜索结果
set incsearch            " 开启实时搜索功能
set ignorecase           " 搜索时大小写不敏感
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup             " 设置不备份
set noswapfile           " 禁止生成临时文件
set autoread             " 文件在vim之外修改过，自动重新读入
set autowrite            " 设置自动保存
set confirm              " 在处理未保存或只读文件的时候，弹出确认
set history=1000         " 设置历史记录条数
set clipboard=unnamed    " 剪贴板设置,与系统共享剪贴板
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim/macvim设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    let system = system('uname -s')
    if system == "Darwin\n"
        set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h16    " 设置字体
    else
        set guifont=DroidSansMono\ Nerd\ Font\ Regular\ 16         " 设置字体
    endif
    "set guioptions-=m           " 隐藏菜单栏
    set guioptions-=T            " 隐藏工具栏
    "set guioptions-=L           " 隐藏左侧滚动条
    "set guioptions-=r           " 隐藏右侧滚动条
    "set guioptions-=b           " 隐藏底部滚动条
    set showtabline=0            " 隐藏Tab栏
    "set guicursor=n-v-c:ver5    "设置光标为竖线(这个要取消不然影响光标看不清)
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 卸载默认插件UnPlug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:deregister(repo)
  let repo = substitute(a:repo, '[\/]\+$', '', '')
  let name = fnamemodify(repo, ':t:s?\.git$??')
  call remove(g:plugs, name)
endfunction
command! -nargs=1 -bar UnPlug call s:deregister(<args>)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件列表
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'chxuan/cpp-mode'                                    "生成函数实现
Plug 'chxuan/vim-edit'                                    "方便的文本编辑插件
Plug 'flazz/vim-colorschemes'                             "vim主题包
Plug 'chxuan/vimplus-startify'                            "vimplus启动主题
Plug 'chxuan/tagbar'                                      "显示类/方法/变量
Plug 'Yggdroot/LeaderF'                                   "比ctrlp更强大的文件的模糊搜索工具
Plug 'mileszs/ack.vim'                                    "强大的文本搜索工具
Plug 'easymotion/vim-easymotion'                          "强大的光标快速移动工具，强大到颠覆你的插件观
Plug 'haya14busa/incsearch.vim'                           "模糊字符搜索插件
Plug 'jiangmiao/auto-pairs'                               "自动补全引号、圆括号、花括号等
Plug 'scrooloose/nerdtree'                                "文件树
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'            "NerdTree文件类型高亮
Plug 'Xuyuanp/nerdtree-git-plugin'                        "git集成插件
Plug 'godlygeek/tabular'                                  "代码、注释、表格对齐
Plug 'tpope/vim-fugitive'                                 "git集成插件，可以在vim中运行git命令
Plug 'tpope/vim-surround'                                 "自动增加、替换配对符的插件
Plug 'tpope/vim-commentary'                               "快速注释代码插件
Plug 'tpope/vim-repeat'                                   "重复上一次操作
Plug 'tpope/vim-endwise'                                  "if/end/endif/endfunction补全
Plug 'octol/vim-cpp-enhanced-highlight'                   "高亮C++的类、成员函数、标准库和模板
Plug 'vim-airline/vim-airline'                            "状态栏插件
Plug 'vim-airline/vim-airline-themes'                     "状态栏主题包
Plug 'ryanoasis/vim-devicons'                             "显示文件类型图标
Plug 'junegunn/vim-slash'                                 "优化搜索，移动光标后清除高亮
Plug 'junegunn/gv.vim'                                    "git提交浏览器
Plug 'kana/vim-textobj-user'                              "文本对象处理
Plug 'kana/vim-textobj-indent'                            "文本对象处理
Plug 'kana/vim-textobj-syntax'                            "文本对象处理
Plug 'kana/vim-textobj-function'                          "文本对象处理
Plug 'sgur/vim-textobj-parameter'                         "文本对象处理
Plug 'Shougo/echodoc.vim'                                 "补全函数时在命令栏显示函数签名
Plug 'terryma/vim-smooth-scroll'                          "让翻页更顺畅
Plug 'rhysd/clever-f.vim'                                 "强化f和F键
Plug 'vim-scripts/indentpython.vim'                       "python代码自动缩进
Plug 'yianwillis/vimcdoc'                                 "Vim中文帮助
Plug 'dense-analysis/ale'                                 "异步语法检查
Plug 'SirVer/ultisnips'                                   "用户自定义补全
Plug 'honza/vim-snippets'                                 "用户自定义补全
Plug 'codota/tabnine-vim'                                 "AI自动补全代码
call plug#end()

" load vim default plugin
runtime macros/matchit.vim

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>

" 打开当前光标所在单词的vim帮助文档
nnoremap <leader>h :execute ":help " . expand("<cword>")<cr>

" 重新加载vimrc文件
nnoremap <leader>s :source $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 分屏窗口移动
nnoremap <c-j> <c-w>j               
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" airline
let g:airline_theme="onedark"                              "设置airline主题
let g:airline_powerline_fonts = 1                          "使用powerline字体
let g:airline#extensions#tabline#enabled = 1               "打开tabline
 
" cpp-mode
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>

" vim-edit
nnoremap Y :CopyText<cr>
nnoremap D :DeleteText<cr>
nnoremap C :ChangeText<cr>
nnoremap <leader>r :ReplaceTo<space>

" nerdtree
nnoremap <silent> <F3> :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let NERDTreeShowHidden=1                                   "显示隐藏文件/文件夹设置"
let g:nerdtree_tabs_autoclose = 1 

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

" tagbar
let g:tagbar_width = 30
nnoremap <silent> <F4> :TagbarToggle<cr>

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" vim-easymotion
let g:EasyMotion_smartcase = 1
map <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" LeaderF
nnoremap <leader>f :LeaderfFile <cr>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_UseCache = 0

" ack
nnoremap <leader>F :Ack!<space>

" echodoc.vim
let g:echodoc_enable_at_startup = 1

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" gv
nnoremap <leader>g :GV<cr>
nnoremap <leader>G :GV!<cr>
nnoremap <leader>gg :GV?<cr>

" cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1


" ale 异步语法检查
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'                                 "自定义error和warning图标
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']    "在vim自带的状态栏中整合ale
let g:ale_echo_msg_error_str = 'E'                         "显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 0                                "打开文件时不进行检查
"普通模式下，sp前往上一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
"普通模式下，sn前往下一个错误或警告
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

" UltiSnips 
let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger = "<a-space>"
"let g:UltiSnipsJumpForwardTrigger = "<a-space>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置文件头
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.go,*.java,*.h,*.hpp,*.c,*.cc,*.cpp,*.sh,*.py,*.m exec ":call SetFileHead()"
func SetFileHead()
    if expand("%:e") == 'go'
        call append(0, "// Go file")
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S")) 
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'java'
        call append(0, '// Java file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'h'
        call append(0, '// C/C++ header file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'hpp'
        call append(0, '// C/C++ header file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S")) 
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'cc'
        call append(0, '// Linux/Unix C++ source file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S")) 
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'c'
        call append(0, '// C source file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'cpp'
        call append(0, '// C++ source file')
        call append(1, '/***********************************************')
        call append(2, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(3, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(4, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(5, '***********************************************/')
    elseif expand("%:e") == 'sh'
        call append(0, '#!/bin/bash')
        call append(1, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(2, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(3, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
    elseif expand("%:e") == 'py'
        call append(0,'#!/usr/bin/env python3')
        call append(1, '# -*- coding: UTF-8 -*-')
        call append(2, '#***********************************************')
        call append(3, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(4, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(5, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(6, '#***********************************************')
    elseif expand("%:e") == 'm'
        call append(0, '# MATLIB/Octave source file')
        call append(1, '# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(2, '# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(3, '# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S")) 
    else
        call append(0, '"************************************************')
        call append(1, '"# Author: '.$USER .expand("(alfangj@126.com)"))
        call append(2, '"# Create Time: '.strftime("%Y-%m-%d %H:%M:%S"))
        call append(3, '"# Modified Time: '.strftime("%Y-%m-%d %H:%M:%S"))  
        call append(4, '"************************************************')
    endif
endfunc
""""""""""""""""""""""""""""""""""""
" 按 Ctrl+F12 添加文件头
""""""""""""""""""""""""""""""""""""
map <silent> <C-F12> :call AddFileHead()<CR>
func! AddFileHead()
    let s:WhetherFileHeadExists = search("# Author: ", "nw")
    if s:WhetherFileHeadExists == 0
        exec ":call SetFileHead()"
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动更新文件修改时间
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePre * call AutoUpdateModifiedTime()
function AutoUpdateModifiedTime()
    let s:CursorPosition = getpos(".")
    call setpos('.', [0, 1, 1, 0])
    let s:WhetherAStringExists = search("# Modified Time: [0-9][0-9]", "nw") 
    if s:WhetherAStringExists != 0
        let s:UperLimitNumber = 8
        if s:WhetherAStringExists < s:UperLimitNumber
           let s:CountNumber = line('$')
           let s:ChangeNumber = s:UperLimitNumber
           if s:CountNumber < s:ChangeNumber
              let s:ChangeNumber = s:CountNumber
           endif
           let s:Currenttime=strftime("%Y-%m-%d %H:%M:%S")
           execute "1,"s:ChangeNumber"s/# Modified Time: [0-9].*/# Modified Time:"s:Currenttime"/g"
        endif 
    endif
    call setpos(".", s:CursorPosition)
endfunction

