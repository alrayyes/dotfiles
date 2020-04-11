" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"  __  __        __     ___
" |  \/  |_   _  \ \   / (_)_ __ ___  _ __ ___
" | |\/| | | | |  \ \ / /| | '_ ` _ \| '__/ __|
" | |  | | |_| |   \ V / | | | | | | | | | (__
" |_|  |_|\__, |    \_/  |_|_| |_| |_|_|  \___|
"         |___/
" }

" Installed Plugins {
    call plug#begin()

    " General {
        " Navigation {
            Plug 'unblevable/quick-scope'
        " }
        Plug 'bling/vim-bufferline'
        Plug 'easymotion/vim-easymotion'
        Plug 'farmergreg/vim-lastplace'
        Plug 'jiangmiao/auto-pairs'
        Plug 'junegunn/fzf'
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'mbbill/undotree'
        Plug 'mhinz/vim-signify'
        Plug 'myusuf3/numbers.vim'
        Plug 'nathanaelkane/vim-indent-guides'
        Plug 'preservim/nerdtree'
        Plug 'rhysd/conflict-marker.vim'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'tpope/vim-abolish'
        Plug 'tpope/vim-surround'
        Plug 'vim-airline/vim-airline'
    " }

    " Programming {
        " Syntax Highlighting {
            Plug 'HerringtonDarkholme/yats.vim'
            Plug 'maxmellon/vim-jsx-pretty'
            Plug 'vim-pandoc/vim-pandoc-syntax'
            Plug 'yuezk/vim-js'
            Plug 'Yggdroot/indentLine'
        " }
        " Tags {
            Plug 'alvan/vim-closetag'
            if executable('ctags')
                Plug 'majutsushi/tagbar'
            endif
        " }
        Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
        Plug 'godlygeek/tabular'
        Plug 'preservim/nerdcommenter'
        Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'tpope/vim-fugitive'
        Plug 'Xuyuanp/nerdtree-git-plugin'
    " }

    " UI {
        Plug 'morhetz/gruvbox'
        " This has to be loaded last to work
        Plug 'ryanoasis/vim-devicons'
    " }
        call plug#end()
" }

" General {
    colorscheme gruvbox                                                            " Set colour scheme
    set clipboard=unnamed,unnamedplus                                              " Use + register for copy-paste

    set mouse=a                                                                    " Automatically enable mouse usage
    set mousehide                                                                  " Hide the mouse cursor while typing

    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif  " Always switch to the current file directory

    set shortmess+=filmnrxoOtT                                                     " Abbrev. of messages (avoids 'hit enter')
    set virtualedit=onemore                                                        " Allow for cursor beyond last character
    set hidden                                                                     " Allow buffer switching without saving
    set iskeyword-=.                                                               " '.' is an end of word designator
    set iskeyword-=#                                                               " '#' is an end of word designator
    set iskeyword-=-                                                               " '-' is an end of word designator
" }

" Vim UI {
    set cursorline             " show cursor line

    highlight clear SignColumn " SignColumn should match background
    highlight clear LineNr     " Current line number row will have same background color in relative mode

    set ignorecase             " Ignore case on search
    set smartcase              " Don't ignore upper case characters on search
    set scrolljump=5           " Lines to scroll when cursor leaves screen
    set scrolloff=3            " Minimum lines to keep above and below cursor
    set foldenable             " Auto fold code
    set list                   " Display whitespace
" }

" Formatting {
    set shiftwidth=4      " Use indents of 4 spaces
    set expandtab         " Tabs are spaces, not tabs
    set tabstop=4         " An indentation every four columns
    set softtabstop=4     " Let backspace delete indent
    set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
    set splitright        " Puts new vsplit windows to the right of the current
    set splitbelow        " Puts new split windows to the bottom of the current
    set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
" }

" Key Mappings {
    " Switch between different windows by their direction
    no <C-j> <C-w>j| "switching to below window 
    no <C-k> <C-w>k| "switching to above window
    no <C-l> <C-w>l| "switching to right window 
    no <C-h> <C-w>h| "switching to left window

    " More convenient leaders
    let mapleader = ","
    let maplocalleader = '_'

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " LanguageClient-neovim
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }

" Plugin Configuration {
    " NerdTree {
        " Start nerdtree automatically when no files are specified
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        " Don't open nerdtree when opening session file
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

        " Start nerdtree automatically when opening up a directory
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

        " Close vim if only windo left is nerdtree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

        " Toggle nerdtree
        map <C-e> :NERDTreeToggle<CR>
    " }

    " Tagbar {
        if executable('ctags')
            " Tagbar panel
            map <Leader>tt :TagbarToggle<CR>
        endif
    " }

    " NerdCommenter {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
    " }

    " Airline {
        " Enable powerline fonts
        let g:airline_powerline_fonts=1
    " }

    " Deoplete {
        " Load deoplete on startup
        let g:deoplete#enable_at_startup = 1
    " }

    " LanguageClient-neovim {
        " Required for operations modifying multiple buffers like rename.
        set hidden

        " Needed for tsx files to work with typescript-language-server
        " https://github.com/theia-ide/typescript-language-server/issues/90
        autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx.

        let g:LanguageClient_serverCommands = {
            \ 'c': ['/usr/bin/ccls'],
            \ 'javascript': ['/usr/bin/typescript-language-server', '--stdio'],
            \ 'javascript.tsx': ['/usr/bin/typescript-language-server', '--stdio'],
            \ 'typescript': ['/usr/bin/typescript-language-server', '--stdio'],
            \ 'typescript.tsx': ['/usr/bin/typescript-language-server', '-gg/-stdio'],
            \ 'php': ['/usr/bin/php-language-server'],
            \ 'python': ['/usr/bin/pyls'],
            \ 'sh': ['/usr/bin/bash-language-server'],
            \ 'css': ['/usr/bin/css-languageserver', '--stdio'],
            \ 'scss': ['/usr/bin/css-languageserver', '--stdio'],
            \ 'sass': ['/usr/bin/css-languageserver', '--stdio'],
            \ 'html': ['/usr/bin/html-languageserver', '--stdio']
            \ }
    " }

    " hexokinase {
        set termguicolors
    " }
" }
