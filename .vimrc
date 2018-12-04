execute pathogen#infect()
call pathogen#helptags()

" set the map leader as space (in normal mode, delete the common value first)
nnoremap <SPACE> <Nop>
let mapleader=","

if has("termguicolors")
  set termguicolors
endif

colorscheme gruvbox 
set background=dark

" gruvbox configuration flags
let g:gruvbox_italic = '1'
let g:gruvbox_italicize_strings= '1'

" set font to gvim
if has('gui_running')
  set guifont=FiraMono\ 9 
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

" Numbers at the beginning of each line
set number
          
" enable syntax processing
syntax enable

" Enable syntax highlighting
syntax on

" Highlight searches (C-L to temporary turn it off)
set hlsearch

" Expand tabs to spaces
set expandtab

" highlight current line
set cursorline

" Size of a hard tabstop
set tabstop=2

" Size of an indent
set shiftwidth=2

" number of spaces in tab when editing
set softtabstop=2

" highlight matching parenthesis
set showmatch

" search as characters are entered
set incsearch

" indent automatically if newline is inserted
set autoindent
set smartindent

" set the line numbers following the cursor
set rnu

" set the ruler
set ruler

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" ignore case and infer case from autocomplete
set ignorecase
set infercase
set wildignorecase

" use ; as :
nnoremap ; :

" remap commands to keybinds 
" Creating and moving between tabs
nnoremap <S-t>          :tabnew<CR>
nnoremap <S-h>          :tabprevious<CR>
nnoremap <S-l>          :tabnext<CR>
nnoremap <S-w>          :tabclose<CR>

" Moving between panels
noremap <C-l>   <C-w>l
noremap <C-h>   <C-w>h
noremap <C-j>   <C-w>j
noremap <C-k>   <C-w>k

" In insert mode, insert a couple of curly braces and be ready to insert
nnoremap <c-P> i{<CR><BS>}<Esc>ko

" remap c-t to ^-[ to have both keys close together
nnoremap <c-[>  <c-t>

" Select all text (equivalent to Ctrl+A in commont text editors)
map <Leader>a ggVG

" Exit file using leader
map <Leader>q :q<CR>

" Save a file using the leader command
nnoremap <Leader>w :w<CR>

" Save and exit using the leader
map <Leader>wq :wq<CR>

" Quit all splts at once
map <Leader>qa :qa<CR>

" save all splits and exit
map <Leader>wqa :wqa<CR>

" call MRU to see most recent files
map <Leader>f :MRU<CR>

" Open buffer list
map <Leader>o :BufExplorer<CR>

" Search for the usage of a symbol under the cursor
map <Leader>c <c-\>s

" Fuzzy file search
let g:ctrlp_map = '<c-f>'

" nerd tree mapping for useful commands
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nb :NERDTreeFromBookmark
map <Leader>nf :NERDTreeFind<CR>

" Split a window and move onto it
nnoremap <Leader>v :vnew<CR>
nnoremap <Leader>n :new<CR>

" replace ESC with <jk>
inoremap jk <esc>

" Insert newline and stay in normal mode
map <Enter> O<Esc>

" remove search highlights with backspace
map <BS> :noh<Esc>

" Smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" create new ctags for a new project with F5
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" toggle the tagbar
nmap <F8> :TagbarToggle<CR> 

" set tag directories for ctags
set tags=./tags,tags;$HOME

" change the current directory to the one which you are right now
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

source ~/.vim/plugins/cscope_maps.vim
source ~/.vim/plugins/smooth_scroll.vim

" Start nerdtree
autocmd vimenter * NERDTree
" Start Tagbar at start
autocmd VimEnter * nested :TagbarOpen

" Hide files with certain extensions
let NERDTreeIgnore = ['\.o$', '\.lo$', '\.la$']

" set libclang path
let g:chromatica#libclang_path='/usr/lib/llvm-3.9/lib'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

" omnicomplete highlights
set tags+=~/.vim/tags/cpp
set tags+=/home/paolo/Lavoro/vimar/source/toolchain/2.3.1/sysroots/cortexa9hf-neon-poky-linux-gnueabi/usr/include/tags

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
