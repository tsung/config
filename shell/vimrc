"gvim setting
"colorscheme desert
"colorscheme ir_black
"set guifont=mingliu:h12

" 字典自動翻譯
set keywordprg=~/bin/ydict
set complete-=k complete+=k

" 設定 vim 編輯預設備份目錄, 必須先 mkdir ~/vi_backup/
set backupdir=~/vi_backup/
set backup

" set php pear path
set path+=/usr/share/php

" set <leader>
let mapleader=","
" map <Leader>h :echo "Hello world."<CR>

"security
set nomodeline

" 游標移動後, 一樣可以用 backspace, del 等刪除動作
set bs=2

"移除 UTF-8 BOM
set nobomb
" 保留 BOM
"set bomb

"set mouse=a

" 過長不要斷行
"set nowrap

" 設定營幕能顯示多少就多少, 不要過長顯示 @
set display=lastline

" 設定最大寬度, 當一行過長時, 會自動換行 (0 是停用此功能)
set textwidth=0

" 搜尋到的字加 hilight
set hlsearch
set incsearch

" 忽略大小寫, 都可以搜尋到
"set ignorecase

" terminal title 會設為 filename
set title

set runtimepath=~/.vim,$VIMRUNTIME
set history=50

filetype on
set number
set cindent
"set autoindent
"set smartindent

" \t 會以 4個空格代替
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" :sp 開檔時, 上面會列出所有檔案
set wildmenu

" 可以用 {{{ }}} 縮排 Folded
set foldmethod=marker

" vim 支援 256色
set t_Co=256

" html indent 支援在 *.php
filetype indent on
filetype plugin indent on " Enable filetype-specific indenting and plugins

" retab
set list
set listchars=tab:->,trail:.

" {{{ syntax highlight
syntax on
":highlight 可以看到所有的顏色
" 顏色 Templates
" /usr/share/vim/vim70/colors/desert.vim
"colorscheme default
"colorscheme desert
colorscheme darkblue
"hi Comment ctermbg=black ctermfg=darkcyan
hi Comment term=standout cterm=bold ctermfg=0
hi Search term=reverse ctermbg=3 ctermfg=0
hi Folded ctermbg=black ctermfg=darkcyan
hi Cursor ctermbg=Gray ctermfg=Blue
"hi Visual ctermbg=yellow ctermfg=blue
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red
"highlight Normal ctermbg=black ctermfg=white
"set background=light
" }}}
" {{{ 下面出現一列 bar.
set laststatus=2
set statusline=%4*%<\ %1*[%F]
set statusline+=%4*\ %5*[%{&encoding}, " encoding
"set statusline+=%{&fileformat}]%m " file format
set statusline+=%{&fileformat}%{\"\".((exists(\"+bomb\")\ &&\ &bomb)?\",BOM\":\"\").\"\"}]%m " file format & bomb detect
set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
highlight User1 ctermfg=red
highlight User2 term=underline cterm=underline ctermfg=green
highlight User3 term=underline cterm=underline ctermfg=yellow
highlight User4 term=underline cterm=underline ctermfg=white
highlight User5 ctermfg=cyan
highlight User6 ctermfg=white

"set ls=2
"set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
"highlight StatusLine term=bold,reverse cterm=bold,reverse
""highlight StatusLine ctermfg=2 ctermbg=0
""highlight StatusLine ctermfg=blue ctermbg=white
" }}}
" {{{ 像 ultraedit 一樣有一列的顏色
" Line highlight
set cursorline
" Column highlight
" set cursorcolumn
"highlight CursorLine cterm=none ctermbg=blue
highlight CursorLine cterm=bold ctermbg=4
" insert 的時後, 將 CursorLine 移除
au InsertEnter * set nocul
au InsertLeave * set cul
" }}}
" {{{ UTF-8 Big5 Setting
" 檔案存檔會存成utf-8編碼
" "set fileencoding=utf-8
" "
" " 以下四個設下去. vim 編出來都是 utf-8 編碼的.
"set fileencoding=utf-8
"set fileencodings=big5,utf-8
"set termencoding=utf-8
"設定自動轉換為 UTF-8 編碼
" vim 新開的檔案預設是 utf-8 編碼(寫檔)
set fileencoding=utf-8
" vim 新開的檔案預設是 utf-8 編碼(讀檔)
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
" 內部在用的encode(vim 內部在用的 encode)
set encoding=utf8
set tenc=utf8
" 使用 <F12> 來將文字編碼轉換成 Big5
map <F12> :set tenc=big5<cr>

" vim 啟動後，是使用 utf-8 編碼
" 所有可能的編碼
" set termencoding=big5
" 當 Terminal.app 的 Display > encoding 是設成 Big5-hkscs，也就是說 terminal
" 會把鍵盤的輸入以 big5 編碼方式送到 vim 時，vim 需要有這個設定，才會將 big5 的輸入
" 轉成上面設定的 utf-8 編碼。如果你的 Terminal.app 是用 utf-8
" 編碼，則可忽略此項。
" }}}
" {{{ For PHP Hot Key
" Map ; to run PHP parser check
"noremap ; :!php -l %<CR>
" Map <CTRL>-P to run actual file with PHP CLI
"noremap <C-P> :w!<CR>:!php %<CR>
" Map <CTRL>-M to search phpm for the function name currently under the cursor (insert mode only)
"inoremap <C-H> <ESC>:!phpm <C-R>=expand("<cword>")<CR><CR>
" Automatic close char mapping
"inoremap  { {<CR>}<C-O>O
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
" }}}
" {{{ 直接按 F8 (Tlist, function list)
"source $HOME/.vim/phpdoc.vim
"ctags apt-get install exuberant-ctags
" }}}
" {{{ ctrl + n, ctrl + p(會自動把function列出) - php
set dictionary+=~/.vim/funclist.txt
" }}}
" {{{ vim 開 tab => imap <C-n> <Esc>:w<CR><Esc>
" NERDTree 關閉按 q 即可
nnoremap <silent> <F5> :NERDTree<CR>
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F9> :set paste<CR>
"nnoremap <silent> <F6> :tabn<CR>
"nnoremap <C-n> <Esc>:tabnew<CR><Esc>:e
map <F2> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
"map <F3> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
map <C-t>l <ESC>:tabnext<CR>
map <C-t>h <ESC>:tabprev<CR>
map <C-t>n <ESC>:tabnew<CR>:NERDTree<CR>
map <C-t>c <ESC>:tabclose<CR>
map <C-t>0 <ESC>:tabfirst<CR>
map <C-t>$ <ESC>:tablast<CR>
map <C-t>q <ESC>:qall<CR>
":nmap <C-t> :tabnew<cr>
"map <C-t>n <ESC>:tabnew<CR><ESC>:e
":nmap <C-tab> :tabnext<cr>
"map <C-w> <ESC>:tabclose<CR>

" vim -p filename1 filname2
" :tabe filename
" gt
" Ctrl-x Ctrl-o
" Ctrl+n 再打就有列表,
" Ctrl+n Ctrl+p 就可以開始打, 然後自動搜尋到 function
" :setlocal spell spelllang=en_gb
" ]s - move to next spelling error
" z= - spelling suggestion
" }}}
" {{{ 會自動到最後離開的位置
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif
" }}}
" {{{ save .vimrc, auto exec, .vimrc 如果存檔, 就會立刻實現
autocmd! bufwritepost .vimrc source %
" }}}
" {{{ 自動去除不必要的空白
" Remove trailing whitespaces
" map \ :%s/[     ]*$//g
map \ :%s/\s*$//g

" 存檔時自動移除結尾空白
autocmd FileType c,cpp,java,php,perl,python,ruby,sh autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" 縮排 加 移除空白
map <f11> <esc>1G=G<cr><esc>:%s/\s*$//<cr><esc>:noh<cr>

"http://blog.bs2.to/post/EdwardLee/17961
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}
" {{{ tab 直接往後退, 而且一直選取著.
" <s-v> + <tab> 或 <s-v> + <s-tab>
xmap   <tab> >gv
xmap   <s-tab> <gv
" }}}
" {{{ python indent
" 開啟 Python 檔案時自動用縮排來 Folding 最多三層
" 縮排跟 Tab 都設定為 4 個空白
" 在關鍵字上按下 K 會透過 ipython 去查詢使用說明
" 或是直接輸入 :Man list 這樣的指令
" 把上面那段 script 加到 .vimrc 裡面就可以使用了
function! s:python_custom()
    function! s:man(keyword)
        echo system('ipython -quick -c "help ' . a:keyword . '"')
    endfunction
    setlocal tabstop=4 expandtab shiftwidth=4
    setlocal foldnestmax=2 foldmethod=indent foldcolumn=3 foldlevel=2
    command! -nargs=1 Man call s:man(<f-args>)
    cnoremap K viwy:Man <C-R>"<CR>
endfunction
if has("autocmd")
    autocmd Filetype python call s:python_custom()
endif
" }}}
" {{{ Tab 顏色
highlight TabLine ctermbg=white ctermfg=black
highlight TabLineFill ctermbg=black
highlight TabLineSel ctermbg=blue ctermfg=white

"hi TabLineFill guifg=#90fff0 guibg=#2050d0 ctermfg=white ctermbg=lightblue
"hi TabLine guifg=#90fff0 guibg=#2050d0 ctermfg=black ctermbg=white
"hi TabLineSel guifg=#90fff0 guibg=#2050d0 ctermfg=white ctermbg=LightMagenta
" }}}
" {{{ 用於自動 load session (Tab)
" Session:
function! AutoLoadSession()
    let g:sessionfile = getcwd() . "/Session.vim"
    if (argc() == 0 && filereadable(g:sessionfile))
        echohl WarningMsg
        echo "Session file exists. Load this? (y/n): "
        echohl None
        while 1
            let c = getchar()
            if c == char2nr("y")
                so Session.vim
                return
            elseif c == char2nr("n")
                return
            endif
        endwhile
    endif
endfunction

function! AutoSaveSession()
    if exists(g:sessionfile)
        exe "mks! " .
        g:sessionfile
    endif
endfunction

augroup AutoLoadSettion
    au!
    au VimEnter * call AutoLoadSession()
    au VimLeave * call AutoSaveSession()
augroup END
" }}}
