"set t_Co=256
"colorscheme molokai
"colorscheme desert
"colorscheme morning
"colorscheme evening
"colorscheme solarized
"colorscheme 256-jungle
colorscheme peaksea

" To use VIM settings, out of VI compatible mode.
set nocompatible
" Enable file type detection.
filetype plugin indent on
" Syntax highlighting.
syntax on

" Config for vim72
if v:version >= 702
set   autoindent
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   nobackup
set   cindent
set   cinoptions=:0
set   completeopt=longest,menuone
set   cursorline
set   encoding=utf-8
set   noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030,chinese
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch
set   ignorecase
set   incsearch
set   laststatus=2
set   mouse=a
set   number
set   pumheight=10
set   ruler
set   scrolloff=5
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   textwidth=80
set   whichwrap=h,l
set   wildignore=*.bak,*.o,*.e,*~
set   wildmenu
set   wildmode=list:longest,full
set   nowrap
endif

if v:version >= 703
"set colorcolumn=+1
endif

" auto expand tab to blanks
" autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" Set mapleader
let mapleader=","
" Space to command mode.
nnoremap <space> :
vnoremap <space> :
" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l

function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction

"AutoComplPop.vim
"let g:acp_behaviorKeywordLength = 1
"let g:AutoComplPop_MappingDriven = 1

"OmniCppComplete.vim
"let g:OmniCpp_DefaultNamespaces=["std"]
"let g:OmniCpp_MayCompleteScope=1
"let g:OmniCpp_SelectFirstItem=2

"taglist.vim
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1

"tagbar.vim
"let g:tagbar_left = 1

"cscope.vim
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" LookupFile setting
let g:LookupFile_TagExpr='"tags.fn"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0

nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :MRU<cr>
nmap  <F5> <Plug>LookupFile<cr>
nmap  <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.cpp **/*.c **/*.h **/*.py **/*.S<cr><C-o>:cw<cr>
nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap <F10> :call HLUDSync()<cr>
nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>

map <leader>ne :NERDTreeToggle<CR>
map <leader>tl :TlistToggle<cr>
nnoremap <leader>ma :set mouse=a<cr>
nnoremap <leader>mu :set mouse=<cr>
nmap <leader>tb :TagbarToggle<CR>
nnoremap <leader>lc :lclose<CR>   "close locationlist
inoremap <leader><leader> <C-x><C-o>"
inoremap <leader><leader> <C-x><C-o>

"let g:indent_guides_auto_colors = 0
"set nospell                           " Spell checking on
autocmd VimEnter * set nospell
let g:spf13_no_autochdir = 1
let c_space_errors = 1
set expandtab

let g:EasyGrepMode           = 0 " All:0, Open Buffers:1, TrackExt:2,
let g:EasyGrepCommand        = 0 " Use vimgrep:0, grepprg:1
let g:EasyGrepRecursive      = 1 " Recursive searching
let g:EasyGrepIgnoreCase     = 1 " not ignorecase:0
