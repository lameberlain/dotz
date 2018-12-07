"oooooo     oooo  o8o
" `888.     .8'   `"'
"  `888.   .8'   oooo  ooo. .oo.  .oo.
"   `888. .8'    `888  `888P"Y88bP"Y88b
"    `888.8'      888   888   888   888
"     `888'       888   888   888   888
"      `8'       o888o o888o o888o o888o

syntax on
set t_Co=256
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
set nocompatible
set backspace=2

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
nmap <leader>v "+p

" inoremap <lt>/ </<C-x><C-o><Esc>==gi
inoremap jk <esc>
" window movement
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

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nmap <leader><Tab> :tabnext<CR>
nmap <leader><S-Tab> :tabprevious<CR>
nmap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

call plug#begin('~/.vim/plugged')
	Plug 'christoomey/vim-sort-motion'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'terryma/vim-smooth-scroll'
	Plug 'nanotech/jellybeans.vim'
	Plug 'w0ng/vim-hybrid'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'Xuyuanp/nerdtree-git-plugin'
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

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>

noremap <Leader>c ::et jursorline! <CR>
map <C-S> :sp $MYVIMRC <CR>
map <C-N> :NERDTreeToggle<CR>
nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>nf :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 3
let g:airline_theme = 'hybrid'

let g:airline_left_sep = ""
let g:airline_right_sep = ""

let g:airline_left_alt_sep = ""
let g:airline_right_alt_sep = ""

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

let g:jsx_ext_required = 0

let g:vcoolor_custom_picker = '/Users/chamberlain/configs/Packages/ColorPicker/lib/osx_colorpicker'


set statusline+=%{FugitiveStatusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Git icons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "\uf040",
    \ "Staged"    : "\uf067",
    \ "Untracked" : "\uf006",
    \ "Renamed"   : "\uf061",
    \ "Unmerged"  : "\uf6fc",
    \ "Deleted"   : "\uf00d",
    \ "Dirty"     : "\uf7a1 ",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "\uf685"
    \ }

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_html_checkers = []

let g:syntastic_error_symbol = "\uf057"
let g:syntastic_style_error_symbol = "\uf00d"
let g:syntastic_warning_symbol = "\uf06a"
let g:syntastic_style_warning_symbol = "\uf12a"

function! SyntasticCheckHook(errors)
	if !empty(a:errors)
		let g:syntastic_loc_list_height = min([len(a:errors), 10])
	endif
endfunction


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = " \uf07b"
let g:NERDTreeDirArrowCollapsible = " \uf114"
set fillchars+=vert:\ 

set background=dark
colo hybrid
set shiftwidth=2

set noexpandtab

augroup InactiveWindows
	autocmd!
	autocmd WinEnter * set cul
	" autocmd WinEnter * set number relativenumber
	" autocmd WinLeave * set norelativenumber
	autocmd WinLeave * set nocul
augroup END
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

highlight LineNr ctermfg=darkgrey ctermbg=none

hi Whitespace ctermfg=DarkGray ctermbg=none
hi Visual ctermfg=white ctermbg=black
hi ColorColumn ctermbg=0
hi Comment cterm=italic ctermfg=darkgray ctermbg=NONE
hi Folded ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE guibg=NONE
let g:webdevicons_conceal_nerdtree_brackets = 1

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
hi SignColumn ctermbg=NONE guibg=NONE
