"set mouse=a


" =============================================================================
" Okan KARAMAN .vimrc file
" -----------------------------------------------------------------------------
" heavily inspired by other users.
" =============================================================================


" -----------------------------------------------------------------------------
" BEHAVIOR
" -----------------------------------------------------------------------------

set nocompatible            " Disable vi compatibility

filetype on                 " filetype must be 'on' before setting it 'off'
"   otherwise it exits with a bad status and breaks
"   git commit.
filetype off                " force reloading *after* pathogen loaded
" Change mapleader (easier to type), at the top since its used everywhere
let mapleader=","
let maplocalleader=";"


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' }
" Plugin 'zxqfl/tabnine-vim'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'gregsexton/MatchTag'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junkblocker/patchreview-vim'
" Plugin 'ervandew/supertab'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-signify'
Plugin 'int3/vim-extradite'

" css
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'

" js
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
" Bundle 'marijnh/tern_for_vim'

" Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colorschemes

Plugin 'blueshirts/darcula'

"MINE

Plugin 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plugin 'vim-scripts/vim-auto-save'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'tmsvg/pear-tree'
Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'
" Plugin 'ianks/vim-tsx'
Plugin 'styled-components/vim-styled-components'

Plugin 'w0rp/ale'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'RRethy/vim-illuminate'
Plugin 'sjl/vitality.vim'
Plugin 'mkitt/tabline.vim'
Plugin 'jparise/vim-graphql'
Plugin 'mbbill/undotree'

" required for vundle
call vundle#end()

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
call plug#end()

syntax on
filetype plugin indent on   " enable detection, plugins and indent

" YCM settings
" let g:ycm_min_num_of_chars_for_completion = 400
" let g:ycm_min_num_identifier_candidate_chars = 400
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
" Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview

" enhance YCM JS completion with tern's smarts
"autocmd FileType javascript setlocal omnifunc=tern#Complete




nnoremap <C-p> :Ag <CR>


let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }



let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)



""let g:prettier#quickfix_enabled = 1

""let g:prettier#autoformat = 1
""autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier
"inoremap <Esc> <Esc>:w<CR>
" .vimrc
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file


" Local dirs (centralize everything)
set backupdir=~/.vim/backups
set directory=~/.vim/swaps


set encoding=utf-8 nobomb   " BOM often causes trouble, UTF-8 is awsum.


" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
"   to disk, will remember history/marks.
set nolazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.
set ruler


" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile


" --- search / regexp ---
set gdefault                " RegExp global by default
set magic                   " Enable extended regexes.
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
"   contain upper-case letters

" --- keys ---
set backspace=indent,eol,start  " allow backspacing over everything.
set nostartofline               " Make j/k respect the columns
" set virtualedit=all            " allow the cursor to go in to 'invalid' places
set timeoutlen=500              " how long it wait for mapped commands
set ttimeoutlen=100             " faster timeout for escape key and others


" Use a bar-shaped cursor for insert mode, even through tmux.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" -----------------------------------------------------------------------------
" UI
" -----------------------------------------------------------------------------

set t_Co=256                " 256 colors terminal

colorscheme darcula

if has('gui_running')
  "set guifont=Menlo:h13
  set gfn:Hack\ Nerd\ Font:h12
  set transp=0
  " toolbar and scrollbars
  set guioptions-=T       " remove toolbar
  set guioptions-=L       " left scroll bar
  set guioptions-=r       " right scroll bar
  set guioptions-=b       " bottom scroll bar
  set guioptions-=h      " only calculate bottom scroll size of current line
  set shortmess=atI       " Don't show the intro message at start and
  "   truncate msgs (avoid press ENTER msgs).
endif


set laststatus=2            " Always show status line
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set title                   " Show the filename in the window title bar.

set scrolloff=5             " Start scrolling n lines before horizontal
"   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
"   horizontally.

" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
  set titlestring=
  set titlestring+=%f
  set titlestring+=%h%m%r%w
  set titlestring+=\ -\ %{v:progname}
  set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" use relative line number by default
if exists('+relativenumber')
  set relativenumber
endif

" --- command completion ---
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif


" --- diff ---
set diffopt=filler          " Add vertical spaces to keep right
"   and left aligned.
set diffopt+=iwhite         " Ignore whitespace changes.


" --- folding---
set foldmethod=manual       " manual fold
set foldnestmax=3           " deepest fold is 3 levels
set nofoldenable            " don't fold by default


" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
" --- list chars ---
" list spaces and tabs to avoid trailing spaces and mixed indentation
" see key mapping at the end of file to toggle `list`
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list

" --- remove sounds effects ---
set noerrorbells
set visualbell



" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=4               " Tab key results in # spaces
set tabstop=4                   " Tab is # spaces
set shiftwidth=4                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width
"   spaces, <Bs> deletes shift width spaces.

set wrap                        " wrap lines
set textwidth=100
"set colorcolumn=+1              " Show large lines
""set formatoptions=qrn1          " automatic formating.
set formatoptions-=o            " don't start new lines w/ comment leader on
"   pressing 'o'

set nomodeline                  " don't use modeline (security)

set pastetoggle=<leader>p       " paste mode: avoid auto indent, treat chars
"   as literal.




" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" --- NERDTree ----
let NERDTreeIgnore=['.DS_Store', '.idea', '.vscode']
let NERDTreeShowBookmarks=0         "show bookmarks on startup
let NERDTreeHighlightCursorline=1   "Highlight the selected entry in the tree
let NERDTreeShowLineNumbers=0
let NERDTreeMinimalUI=1

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'



let g:NERDTreeIndicatorMapCustom = {
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

let g:NERDTreeShowIgnoredStatus = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1


let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['js'] = s:aqua " sets the color for .gitignore files



let g:NERDTreeLimitedSyntax = 1

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'html', 'json', 'css'] " example
let g:NERDTreeHighlightCursorline = 0

let g:nerdtree_tabs_open_on_console_startup = 1



" --- NERDCommenter ---

let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDCustomDelimiters = {
      \ 'scss': { 'left': '//' }
      \ }


" --- Syntastic : Linting / Error check ---
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1
" close/open location list (errors)
noremap <silent><leader>lc :lcl<CR>
noremap <silent><leader>lo :Errors<CR> :lw<CR>
noremap <silent><leader>ln :lnext<CR>
noremap <silent><leader>lp :lprev<CR>


" --- autocomplete / supertab / jscomplete ---
set infercase
set completeopt=longest,menuone
set complete=.,w,b,u,U,t,i,d
" see [autocommands] at the end for more autocomplete settings

" nodejs-complete / jscomplete
let g:node_usejscomplete = 1
let g:jscomplete_use = ['dom', 'moz']

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-Space>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabDefaultCompletionType = "<c-p>"

" --- vim-css-color ---
let g:cssColorVimDoNotMessMyUpdatetime = 1


" --- vim-signify ---
let g:signify_update_on_focusgained = 1


" --- LustyJuggler ---
let g:LustyJugglerSuppressRubyWarning = 1  " avoid error if running on terminal


" --- statline ---
" errors color
hi User3 guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15 ctermbg=1 cterm=bold
let g:statline_fugitive = 1
let g:statline_filename_relative = 1
let g:statline_mixed_indent_string = '[mix]'

set splitbelow splitright   " how to split new windows.



" --- toggle indentation mode ---

function! ToggleExpandTab()
  if &et
    set noet softtabstop=0
  else
    execute "set et softtabstop=". &tabstop
  endif
endfunction

noremap <silent> <leader>et :call ToggleExpandTab()<CR>


" --- Show syntax highlighting groups for word under cursor ---
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
nnoremap <leader>sh :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" faster wehn opening files with large lines
set synmaxcol=120


"" MY SHORCUTS
nnoremap <silent> <leader>ll :Prettier<CR>
vnoremap <silent> <leader>ll :Prettier<CR>

nnoremap <silent> <leader>ut :UndotreeToggle<CR>

"" MY SETTINGS
let NERDTreeShowHidden=1
set nu rnu
noremap  <Up> <nop>
noremap  <Down> <nop>
noremap  <Left> <nop>
noremap  <Right> <nop>
inoremap  <Up> <nop>
inoremap  <Down> <nop>
inoremap  <Left> <nop>
inoremap  <Right> <nop>
vnoremap  <Up> <nop>
vnoremap  <Down> <nop>
vnoremap  <Left> <nop>
vnoremap  <Right> <nop>

command! W w
command! Wq wq
command! Bd bd
command! Q q
command! QQ tabo | q
command! T tabo
command! F Files

nnoremap <C-k> :Gfetch <CR> :Gstatus<CR> :Twiggy<CR> <C-W> h
nnoremap <S-K> :Gstatus<CR>


" automatic esc, really uncommon to type jj,jk
" inoremap jj <ESC>
" inoremap jk <Esc>

" Faster scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Clear the search highlight
nnoremap <silent> \ :silent nohlsearch<CR>

" text wrap: Hard wrap paragraph text (similar to TextMate Ctrl+Q)
nnoremap <leader>tw gqip
nnoremap <leader>nw :set nowrap<CR>

" I use retab too much and it's hard to type
nnoremap <leader>rt :retab!<CR>

" Open current buffer in a new split
""noremap <leader>s :vsplit<cr>
""noremap <leader>i :split<cr>

" close window
noremap <leader>q :clo<CR>
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" For local replace
nnoremap gr yiw{V}::s/<C-R>0//gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>


set keymodel=startsel

set guitablabel=%N\ :\ %M%t
""autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
set cursorline





" COC CONFIG BEGIN /////////////////////////////////////////
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <leader>j <Plug>(coc-range-select)
xmap <leader>j <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" COC CONFIG ENDS /////////////////////////////////////////

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
