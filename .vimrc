" Turn off vi compatibility, everybody hates vi
set nocompatible

" Turn on UTF-8 and multibyte encodings
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=utf-8,ucs-bom,latin1
endif

" Tab options, they are good
set tabstop=4
set shiftwidth=4
set expandtab
" C language indentation
set cinoptions="(0,W4"
set autoindent
" set cindent
" Show matching brackets when typing
set showmatch
" Show partial commands
set showcmd
" Show the ruler (info display at the bottom of the window)
set ruler
" Turn on line numbering
set number
" Set the directory for swapfiles and disable backups
set dir=/tmp
set nobackup
" Highlight the line with the cursor
set cursorline
" Turn on automatic reading
set autoread

" Turn off tab expansion to spaces in Makefiles
autocmd FileType make setlocal noexpandtab

" Set text wrapping for git commits
autocmd FileType gitcommit setlocal textwidth=70

" Markdown extension
au BufNewFile,BufRead *.md  setf markdown

function! PythonInit()
    " Set up ropevim
    let g:ropevim_vim_completion = 1
    let g:ropevim_extended_complete = 1
    let g:ropevim_guess_project = 1
    let g:ropevim_enable_shortcuts = 1

    source ~/.vim/bits/ropevim.vim
endfunction

autocmd FileType python call PythonInit()

" Turn on syntax highlighting
syntax enable

" Turn on display of tabs and trailing spaces
set list
set listchars=tab:→\ ,trail:·

" Map space to insert a single character before the cursor
nmap <Space> i_<Esc>r

" Load up clang completion options
let g:clang_complete_copen = 1
let g:clang_complete_auto = 1

" Tab-completion
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Polish.
noremap! <C-Y> <Esc>klywjpa

" Turn on the visual bell
set vb

" Swap around the command-mode bindings of . and :
nnoremap : .
nnoremap . :

