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
        Plug 'junegunn/fzf.vim'
        Plug 'mbbill/undotree'
        Plug 'mhinz/vim-signify'
        Plug 'myusuf3/numbers.vim'
        Plug 'preservim/nerdtree'
        Plug 'rhysd/conflict-marker.vim'
        Plug 'terryma/vim-multiple-cursors'
        Plug 'tpope/vim-abolish'
        Plug 'tpope/vim-surround'
        Plug 'vim-airline/vim-airline'
    " }

    " Programming {
        Plug 'airblade/vim-gitgutter'
        Plug 'alvan/vim-closetag'
        Plug 'dense-analysis/ale'
        Plug 'godlygeek/tabular'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'preservim/nerdcommenter'
        Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
        Plug 'sheerun/vim-polyglot'
        Plug 'tpope/vim-fugitive'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'Yggdroot/indentLine'
    " }

    " UI {
        Plug 'gruvbox-community/gruvbox'
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
    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
    map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
    map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
    map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
    map <Leader>lb :call LanguageClient#textDocument_references()<CR>
    map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
    map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

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

    " NerdCommenter {
        " Add spaces after comment delimiters by default
        let g:NERDSpaceDelims = 1
    " }

    " Airline {
        " Enable powerline fonts
        let g:airline_powerline_fonts=1
    " }

    " hexokinase {
        set termguicolors
    " }

    " coc {
        vmap <leader>f  <Plug>(coc-format-selected)
        nmap <leader>f  <Plug>(coc-format-selected)

        " Run jest for current project
        command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

        " Run jest for current file
        command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

        " Run jest for current test
        nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

        " Init jest in current cwd, require global jest command exists
        command! JestInit :call CocAction('runCommand', 'jest.init')

        " use <Tab> and <S_tab> to navigate completion list
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " }

    " ale {
        " Shortcuts jump between linting errors
        map <silent> [c <Plug>(ale_previous_wrap)
        nmap <silent> ]c <Plug>(ale_next_wrap)

        let g:ale_sign_error = '❌'
        let g:ale_sign_warning = '⚠️'

        " Fix files
        let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'sh': ['shfmt'], 'json': ['prettier']}

        " Fix files automatically on save
        let g:ale_fix_on_save = 1
    " }

    " easymotion {
        let g:EasyMotion_do_mapping = 0 " Disable default mappings

        " Jump to anywhere you want with minimal keystrokes, with just one key binding.
        " `s{char}{label}`
        nmap s <Plug>(easymotion-overwin-f)
        " or
        " `s{char}{char}{label}`
        " Need one more keystroke, but on average, it may be more comfortable.
        nmap s <Plug>(easymotion-overwin-f2)

        " Turn on case-insensitive feature
        let g:EasyMotion_smartcase = 1

        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)
    " }

    " fzf {
        nnoremap <silent> <C-f> :Files<CR>
        nnoremap <silent> <Leader>f :Rg<CR>

        nnoremap <silent> <Leader>f :Rg<CR>
        nnoremap <silent> <Leader>/ :BLines<CR>
        nnoremap <silent> <Leader>' :Marks<CR>
        nnoremap <silent> <Leader>g :Commits<CR>
        nnoremap <silent> <Leader>H :Helptags<CR>
        nnoremap <silent> <Leader>hh :History<CR>
        nnoremap <silent> <Leader>h: :History:<CR>
        nnoremap <silent> <Leader>h/ :History/<CR> 

    " }
" }
