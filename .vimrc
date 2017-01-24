" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

"set cursorline
"hi Cursorline cterm=NONE ctermbg=lightyellow ctermfg=black guibg=darkred guifg=white

set history=200         "set command history
set directory=$HOME/.cache/vim//  "设置 swp 文件所在的位置
set showmatch           " 设置匹配模式，显示匹配的括号
set linebreak           " 整词换行
"set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set mouse=a             "Enable mouse usage (all modes) 
"set mousemodel
set number              "显示行号

"-- 状态行设置 --
set laststatus=2        "总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler
"标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。 

"-- 命令行设置 --
set showcmd             "命令行显示输入的命令
set showmode            "命令行显示vim当前模式

set smartcase           "如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set incsearch           "highlight the next search match

"-- tab和缩进的设置 --
set expandtab           "tab -> space
set tabstop=4           "设置制表符(tab键)的宽度
set shiftwidth=4        "(自动) 缩进使用的4个空格
set softtabstop=4       "设置制表符(tab)在编辑时占用4个空格
"set autoindent          "设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置

"--Special key --
set backspace=indent,eol,start

"-- 对javascript语言的设置 --
autocmd FileType javascript setlocal sw=2 ts=2 sts=2
autocmd FileType json setlocal sw=2 ts=2 sts=2

"-- xml
autocmd FileType xml setlocal sw=2 ts=2 sts=2

"-- Java --
autocmd FileType java setlocal sw=4 ts=4 sts=4


"call plug#begin('~/.config/nvim/plugged') -- for nvim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'shougo/unite.vim',

Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'valloric/youcompleteme'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'FishThirteen/fish-snippets'

Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'skywind3000/asyncrun.vim'
call plug#end()


"--detect file type--
filetype on
filetype plugin on
syntax on

"colorscheme solarized
set background=dark

set pastetoggle=<F2>

"--Tagbar
nmap <F8> :TagbarToggle<CR>

"--NERD Tree
map <C-n> :NERDTreeToggle<CR>

"-- snippets
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><C
nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR

"--自动加载当前文件夹下的cscope.out，不需要cs add了
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    "else
    "    let cscope_file=findfile("cscope.out", ".;")
    "    "echo cscope_file
    "    if !empty(cscope_file) && filereadable(cscope_file)
    "        exe "cs add" cscope_file
    "    endif      
     endif
endif

"-- Vim Wiki的配置
let g:vimwiki_use_mouse=0
let g:vimwiki_list=[{'path': '/data/YYT/VimWiki/personal',
    \'path_html': '/data/YYT/VimWiki/personal/html',
    \'html_header': '/data/YYT/VimWiki/template/header.tpl', },
    \{'path': '/data/YYT/VimWiki/public/it',
    \'path_html': '/data/YYT/VimWiki/public/html/it',
    \'html_header': '/data/YYT/VimWiki/template/header.tpl', },
    \{'path': '/data/YYT/VimWiki/public/invest',
    \'path_html': '/data/YYT/VimWiki/public/html/invest',
    \'html_header': '/data/YYT/VimWiki/template/header.tpl', },
    \{'path': '/data/YYT/VimWiki/public/reading',
    \'path_html': '/data/YYT/VimWiki/public/html/reading',
    \'html_header': '/data/YYT/VimWiki/template/header.tpl', }]


"-- Read syntastic setting file to work with gradle
function s:findAbsoluteNameInParentRecursively(fileName) 
  let s:tempFileName = a:fileName
  let s:tempDirName = getcwd()

  while s:tempDirName != "/"
    if filereadable(glob(s:tempFileName))
      return s:tempFileName
    else
      let s:tempDirName = fnamemodify(s:tempDirName, ":h")  
      let s:tempFileName = s:tempDirName . "/" . a:fileName
    endif  
  endwhile

  return 0
endfunction

let s:syntasticSettingFileName = ".syntastic-classpath"
let s:configFileName = s:findAbsoluteNameInParentRecursively(s:syntasticSettingFileName)

if filereadable(s:configFileName)
    let g:syntastic_java_javac_config_file_enabled = 1
    let g:syntastic_java_javac_config_file = s:configFileName
endif

