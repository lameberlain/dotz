"oooooo     oooo  o8o
" `888.     .8'   `"'
"  `888.   .8'   oooo  ooo. .oo.  .oo.
"   `888. .8'    `888  `888P"Y88bP"Y88b
"    `888.8'      888   888   888   888
"     `888'       888   888   888   888
"      `8'       o888o o888o o888o o888o

" install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

nnoremap <leader>big :r ! figlet -f roman
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+d
vmap <C-v> c<ESC>"+p
nmap <leader>v "+p

" inoremap <lt>/ </<C-x><C-o><Esc>==gi
inoremap jk <esc>
inoremap kj <esc>
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

nnoremap <Tab> :tabnext<CR>
nmap <S-Tab> :bnext<CR>
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
" language plugins
Plug 'Chiel92/vim-autoformat'
Plug 'chr4/nginx.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mhinz/vim-mix-format'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

" usage plugins
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-sort-motion'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Quramy/tsuquyomi'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
call plug#end()
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 3
" let g:airline_theme = 'hybrid'
"
" let g:airline_left_sep = ""
" let g:airline_right_sep = ""
"
" let g:airline_left_alt_sep = ""
" let g:airline_right_alt_sep = ""
"
" " set the CN (column number) symbol:
" let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

noremap <Leader>c ::et jursorline! <CR>
map <C-S> :sp $MYVIMRC <CR>


let g:jsx_ext_required = 0

let g:vcoolor_custom_picker = '/Users/chamberlain/configs/Packages/ColorPicker/lib/osx_colorpicker'

"
" set statusline+=%{FugitiveStatusline()}
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:gitgutter_sign_added = "+"
let g:gitgutter_sign_modified = "~"
let g:gitgutter_sign_removed = "-"
let g:gitgutter_sign_removed_first_line = "^"
let g:gitgutter_sign_modified_removed = "~-"

autocmd BufWritePost * GitGutter

nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

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
autocmd StdinReadPre * let s:std_in=1
set fillchars+=vert:\

set background=dark
colo hybrid
set shiftwidth=2

set noexpandtab

augroup InactiveWindows
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
	autocmd WinEnter * if @% != "NetrwTreeListing 6" | set number relativenumber
	autocmd WinLeave * if @% != "NetrwTreeListing 6" | set norelativenumber
augroup END
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

hi Whitespace ctermfg=DarkGray ctermbg=none guifg=Grey23
hi Visual ctermfg=white ctermbg=black
hi ColorColumn ctermbg=0
hi Comment cterm=italic ctermfg=darkgray ctermbg=NONE
hi Folded ctermbg=NONE guibg=NONE
hi Normal ctermbg=NONE guibg=NONE

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
hi SignColumn ctermbg=NONE guibg=NONE

highlight LineNr ctermfg=darkgray ctermbg=none guifg=darkgray

let g:ackprg = 'ag --vimgrep'

let g:netrw_banner = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Formatter settings
" let g:autoformat_verbosemode=1
au BufWrite * :Autoformat
