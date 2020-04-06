let mapleader=" "

syntax on
set number 
set relativenumber
set cursorline
set wrap
set showcmd 
set wildmenu 
set mouse=a
set encoding=utf-8
set bg=light
set t_Co=256

set noswapfile
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2

"Search setting
set hlsearch
set incsearch
set ignorecase
set smartcase

set clipboard=unnamed
set mouse=nicr

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

map s <nop>
nmap <LEADER>s :w<CR>
nmap <LEADER>q :q<CR>
map R :source $MYVIMRC<CR>
map <LEADER>p "+p
map <LEADER>y "+y

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/taglist.vim'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'yuttie/hydrangea-vim'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'python-mode/python-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

"------------------
"  colorscheme
"------------------
colorscheme onedark
let g:airline_theme='behelit'

" python 
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

" highlight python self
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold


"------------------
"  Nerdtree
"------------------
map tt :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"------------------
"  YouCompleteMe
"------------------
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>


"------------------
"  Goyo 
"------------------
map <LEADER>gy :Goyo<CR>


"------------------
"  Vim-signature
"------------------
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

"------------------
" markdown-preview
"------------------

"------------------
" python-mode
"------------------
let g:pymode_folding = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

"------------------
" Output method
"------------------
function! Fcitx2en()
    let input_status = system('fcitx-remote')
    if input_status == 2
        let b:inputtoggle = 1
        call system('fcitx-remote -c')
    endif
endfunction
function! Fcitx2zh()
    try
	if b:inputtoggle == 1
	    call system('fcitx-remote -o')
	    let b:inputtoggle = 0
	endif
    catch /inputtoggle/
        let b:inputtoggle = 0
    endtry
endfunction
" Autocmds:
au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()

