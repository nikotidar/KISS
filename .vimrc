set encoding=utf-8
scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'terryma/vim-multiple-cursors'
    let g:multi_cursor_use_default_mapping=0
    let g:multi_cursor_next_key='<C-j>'
    let g:multi_cursor_prev_key='<C-k>'
    let g:multi_cursor_skip_key='<C-s>'
    let g:multi_cursor_quit_key='<Esc>'

Plug 'w0rp/ale'
    let g:ale_sign_column_always = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_fix_on_save = 1

Plug 'dylanaraps/wal.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'terryma/vim-expand-region'
	vmap v <Plug>(expand_region_expand)
	vmap <C-v> <Plug>(expand_region_shrink)

Plug 'mzlogin/vim-markdown-toc'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
	nmap ss ysiw
	nmap sl yss
	vmap s S

call plug#end()
filetype plugin on

colorscheme term

cmap w!! w !sudo tee % >/dev/null
cnoreabbrev q qa
nmap az za
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap H 0
nnoremap L A
nnoremap j gj
nnoremap k gk
noremap ; :
vmap <BS> <gv
vmap <TAB> >gv
vnoremap H 0
vnoremap L $
vnoremap j gj
vnoremap k gk
xnoremap p pgvy

set signcolumn=yes
set noshowmode
set laststatus=2
set synmaxcol=150
set shortmess=atI
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set breakindent
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set re=1
set foldmethod=marker
set foldlevel=99
set foldlevelstart=0
set hlsearch
set incsearch
set ignorecase
set smartcase
set undofile
set undolevels=1000
set undoreload=1000
set autochdir
set clipboard=unnamedplus
set nostartofline
set notimeout
set nottimeout
set nrformats-=octal
set modeline
set backspace=indent,eol,start
set noswapfile
set backupdir=~/.vim/tmp/backups/
set undodir=~/.vim/tmp/undo/

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

augroup General
    au!
    autocmd FileType markdown,text setlocal spell
    autocmd FileType * setlocal formatoptions-=cro
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType scss,css  setlocal shiftwidth=2 softtabstop=2

    autocmd BufWritePre [:;]* throw 'Forbidden file name: ' . expand('<afile>')
    autocmd BufWritePre * :%s/\s\+$//e
augroup END

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<c-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ "<c-S>" : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\     " The current mode
set statusline+=%1*\ %<%F\                                  " File path
set statusline+=\ %1*\                                      " Padding & switch colour
set statusline+=%y                                          " File type
set statusline+=\ %2*\                                      " Padding & switch colour
set statusline+=%=                                          " Switch to right-side
set statusline+=\ %3*\                                      " Padding & switch colour
set statusline+=%02l/%L\ :\ %02v\ %0*                       " Postition and line numbers
