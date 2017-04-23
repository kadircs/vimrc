set number
set foldmethod=syntax
colorscheme desert
set background=dark

if !has('gui_running')
      set t_Co=256
endif
set autoread
" Turn on the WiLd menu
set wildmenu
"
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

augroup CursorLine
        au!
            au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
            "au VimEnter,WinEnter,Buf   WinEnter * hi CursorLine  ctermbg=4
            "    "7 for white background
            "       "au VimEnter,WinEnter,BufWinEnter * hi CursorLine  ctermbg=7
                       au WinLeave * setlocal nocursorline
                       augroup END

                      let g:ctags_statusline=1
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ CWD:\ %r%{getcwd()}%h\  \ %l/%L
au BufReadPost,FileReadPost * au InsertEnter * hi StatusLine ctermbg=Yellow
au BufReadPost,FileReadPost * au InsertLeave * hi StatusLine ctermbg=White 
" COMMENT   C/C++ using ctrl shift c
"map <C-C> :s/^/\/\//<Enter>
" UNCOMMENT C/C++ using ctrl shift U
"map <C-U> :s/^\/\///<Enter>

"show function name in c when f is pressed
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
