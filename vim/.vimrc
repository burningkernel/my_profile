
colorscheme molokai "设置主题颜色

syntax on "设置开启代码高亮

"设置打开行标号，显示命令
set nu
set showcmd

"设置文件的编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"设置文件类型检测
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.c set filetype=c
autocmd BufRead,BufNewFile *.cpp set filetype=cpp
autocmd BufRead,BufNewFile *.py set filetype=python

"设置水平和垂直标尺，设置末尾标尺
set cursorline cursorcolumn
set colorcolumn=80



"设置自动添加文件头
autocmd BufNewFile *.cpp,*.c,*.h,*.sh,*.py exec ":call SetTitle()"
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: fatmouse") 
        call append(line(".")+2, "\# mail: burningkernel@icloud.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    elseif &filetype == 'python'
        call setline(1,"\#########################################################################")
        call append(line("."),"\# File Name: ".expand("%"))
        call append(line(".")+1,"\# Author: fatmouse")
        call append(line(".")+2,"\# mail: burningkernel@icloud.com")
        call append(line(".")+3,"\# Created Time: ".strftime("%c"))
        call append(line(".")+4,"\# code:utf-8")
        call append(line(".")+5,"\#########################################################################")
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: fatmouse") 
        call append(line(".")+2, "    > Mail: burningkernel@icloud.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 

"插件安装
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"plugin list
Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
filetype on


"设置f5 打开目录浏览
nmap <F5> :NERDTreeToggle<cr>

"打开powerline
set nocompatible
set laststatus=2
let g:Powerline_symbols = 'fancy'
"使syntax工作
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
