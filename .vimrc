syntax on
set number relativenumber
set list
set listchars=tab:→\ ,space:·,nbsp:•,trail:•
set tabstop=2
set breakindent
set wildmenu
set incsearch
set cul
set mouse=a
set foldmethod=indent
set foldlevel=20

" inoremap <lt>/ </<C-x><C-o><Esc>==gi
inoremap jk <esc>
" window movement arrow keyz
nnoremap <Down> <C-W><C-J>
nnoremap <Up> <C-W><C-K>
nnoremap <Right> <C-W><C-L>
nnoremap <Left> <C-W><C-H>

nmap <leader>j <C-W><C-J>
nmap <leader>k <C-W><C-K>
nmap <leader>l <C-W><C-L>
nmap <leader>h <C-W><C-H>

map <Space> <leader>

nmap <silent> <leader>evrc :e $MYVIMRC<CR>
nmap <silent> <leader>lvrc :so $MYVIMRC<CR>

call plug#begin('~/.vim/plugged')
	Plug 'christoomey/vim-sort-motion'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'ryanoasis/vim-devicons'
	Plug 'KabbAmine/vCoolor.vim'
	Plug 'cakebaker/scss-syntax.vim'
	Plug 'Quramy/tsuquyomi'
	Plug 'vim-syntastic/syntastic'
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	Plug 'flazz/vim-colorschemes'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'jeetsukumaran/vim-indentwise'
	Plug 'elixir-editors/vim-elixir'
	Plug 'mhinz/vim-mix-format'
	Plug 'slashmili/alchemist.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'leafgarland/typescript-vim'
	Plug 'posva/vim-vue'
	Plug 'morhetz/gruvbox'
call plug#end()


noremap <Leader>c ::et jursorline! <CR>
map <C-S> :sp $MYVIMRC <CR>
map <C-N> :NERDTreeToggle<CR>
nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 3
let g:airline_theme = 'gruvbox'

let g:airline_left_sep = "\ue0c0"
let g:airline_right_sep = "\ue0c2"

let g:airline_left_alt_sep = "\ue0c1"
let g:airline_right_alt_sep = "\ue0c3"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

let g:jsx_ext_required = 0

let g:vcoolor_custom_picker = '/Users/chamberlain/configs/Packages/ColorPicker/lib/osx_colorpicker'

highlight LineNr ctermfg=darkgrey

set statusline+=%{FugitiveStatusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_html_checkers = []

function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 10])
	endif
endfunction

hi Whitespace ctermfg=DarkGray
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = "\uf07b"
let g:NERDTreeDirArrowCollapsible = "\uf114"
set fillchars+=vert:\ 
hi ColorColumn ctermbg=0
colo gruvbox
highlight Normal ctermbg=NONE
set shiftwidth=2
hi Visual ctermfg=white ctermbg=black

set noexpandtab
hi Folded ctermbg=none

augroup InactiveWindows
	autocmd!
	autocmd WinEnter * set cul
	" autocmd WinEnter * set number relativenumber
	" autocmd WinLeave * set norelativenumber
	autocmd WinLeave * set nocul
augroup END
let g:webdevicons_conceal_nerdtree_brackets = 1
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

