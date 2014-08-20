﻿scriptencoding utf-8	" See http://superuser.com/questions/556915 and elsewhere.
set encoding=utf8
set nocompatible		" Put this first in vimrc (because it affects many other settings).

"===== VUNDLE ==========================
" :PluginList			-  list configured plugins
" :PluginInstall[!]		-  install (! => update) plugins
" :PluginUpdate			-  update plugins
" :PluginSearch[!] foo	-  search (! => refresh cache first) for foo
" :PluginClean[!]		-  confirm (! => auto-approve) removal of unused plugins
" See :help vundle for more details or https://github.com/gmarik/vundle/wiki for FAQ
" NOTE: Add to .gitignore: 'bundle/**' and then exception '~bundle/vundle' so that git tracks only vundle itself.

filetype off  " Required for Vundle startup; turn on again afterwards.
set runtimepath+=$HOME/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle' " Let Vundle manage Vundle. Required.

"-- original github repos --
Plugin 'bling/vim-airline'			" Powerful yet light statusline. :help airline for config options.
Plugin 'vim-scripts/AutoClose'		" Auto-closes (, [, {, \", '.
Plugin 'gioele/vim-autoswap'		" Deal more intelligently with .swp files.
Plugin 'Lokaltog/vim-easymotion'	" Super-quick jump to word/line/search-term/etc. :help easymotion
"Plugin 'tpope/vim-fugitive'		" git plugin. See http://vimcasts.org/blog/2011/05/the-fugitive-series/
Plugin 'vim-scripts/matchit.zip'	" Use '%' to jump between opening/closing HTML/XML tags, if/else-if/else, etc.
Plugin 'vim-scripts/MultipleSearch'	" Highlight multiple search terms in different colours. :help MultipleSearch
Plugin 'scrooloose/nerdtree'		" File explorer. (:help nerdtree) I have :NERDTreeToggle mapped to <F2>
Plugin 'tpope/vim-ragtag'			" Convenience for XML/HTML tags.
Plugin 'kien/rainbow_parentheses.vim'  " Colours parentheses and brackets according to nesting.
Plugin 'tpope/vim-repeat'			" Lets '.' (repeat) work with (supported) plugin commands.
"Plugin 'msanders/snipmate'			" Code snippets.
Plugin 'tpope/vim-speeddating'		" Use CTRL-A/CTRL-X to increment/decrement dates, times, and more.
Plugin 'mhinz/vim-startify'			" Startup screen with recently-used files, sessions, bookmarks, etc.
Plugin 'majutsushi/tagbar'			" Sidebar for coding symbols (ctags).
Plugin 'tpope/vim-surround'			" Wrap existing text in quotes, brackets, tags, etc.
Plugin 'tomtom/tcomment_vim'		" Toggle line-/block-wise comments.

"-- vim-scripts.org repos --
Plugin 'python_match.vim'			" Use '%' to jump between Python if/elif/else, try/except/catch, etc.

"-- non-github repos --
"Example:	Plugin 'git://git.wincent.com/command-t.git'

"-- *local* files --
"Example:	Plugin 'file:///Users/gmarik/path/to/plugin'

call vundle#end()
filetype plugin indent on  " Required. Equivalent to 'filetype on' AND 'filetype plugin on' AND 'filetype indent on'.


"===== GENERAL =========================
syntax on				" I believe this has to occur early in the vimrc.

"_____Tabbing and Indenting_____
set tabstop=4			" Tab Stops of four spaces (default was eight).
set shiftwidth=4		" Auto-indent by four spaces.
set softtabstop=4 		" When hitting tab or backspace, how many spaces should a tab be (see expandtab).
set shiftround 			" Round the indention nicely with other indents.
set smarttab
"set expandtab			" Convert tabs to spaces. I don't think I want this globally.
set autoindent
set smartindent			" cf. cindent

"_____Other text manipulation_____
set textwidth=0			" NEVER automatically insert a hard newline.
set linebreak			" Soft-wrap at word boundaries rather than right at the end of the screen.
" See ':help fo-table' for formatoptions options. vim default is 'tcq'. Use '+=' and '-=' to modify.
set formatoptions+=rjl	" r = prefix comment character on Enter from a comment line;
						" j = drop second comment marker when joining two comment lines;
						" l = don't hard-wrap long lines.
set pastetoggle=<F3>	" Allow pasting from system clipboard into terminal vim without messing up indents.
						" See also the <F3> keymapping below.

"_____Extra-textual info/visibility_____
set number				" Line numbers (absolute). See KEY-MAPPINGS and FUNCTIONS for relative-numbering toggle.
set showmode			" Shows the mode in the last line. (This is actually on by default.)
set showmatch			" Show matching brackets.
set cursorline			" Highlight current line.
"set cursorcolumn		" Hightlight current column.
set report=0			" Always tell us when anything is changed via a ':' command.
set showcmd				" Show the command being typed.
set ruler				" Always show current positions along the bottom.
set laststatus=2		" Always show the statusline. See vim-airline plugin for statusline settings.
"set list				" Display non-printing characters (according to listchars).
set listchars=tab:»-,trail:·,eol:¶,extends:×,precedes:÷,nbsp:°  " Characters for non-printing chars (if 'list' is set).
set showbreak=\|		" String to indicate soft-wrapped lines.
set noerrorbells		" Suppress audible bell.
set novisualbell		" Suppress visual bell. cf. t_vb
set history=100			" Remember last n commands/searchs/etc.

"_____Movement_____
set backspace=indent,eol,start
set nostartofline		" Don't always move cursor to beginning of line; leave it in the column I was on.
set scrolloff=3			" Minimum number of screen lines to keep above and below the cursor.
set whichwrap=b,s,<,>,[,],~	" Allow these to traverse lines: <BS>, <SPACE>, <LEFT>, <RIGHT>, ~.

"_____Searching_____
set ignorecase			" Necessary for smartcase to work.
set smartcase			" Case-sensitive if any capitals in search term, else insensitive. '\c' forces insensitive; '\C' force sensitive.
set incsearch			" Incremental search: start matching as soon as you start typing search term.
set hlsearch			" Highlight search matches.
set nowrapscan			" Do NOT continue search from top when you reach the bottom.
set wildmenu			" Autocompletion stuff.
set wildmode=longest,list,full
set wildignore=*~,*.bak,*.class,*.pyc,*.sw?

"_____Mousing_____
set mouse=a				"Allow mouse in all modes.

"_____Buffers_____
set hidden				" Do NOT require a buffer to be saved before switching to a different one.

"_____Spelling_____
set spelllang=en_ca
"set spell

"_____Misc_____
" Don't wait so long for the next keypress (particularly in ambigious Leader situations).
"set timeoutlen=500


"===== GUI (gvim) SETTINGS =============
if has('gui_running')
		colorscheme torte 	" My color scheme (looks horrid in terminal for some reason).
		set columns=120 	" Default window size.
		set lines=50		" Default window size.
		set mousehide		" Hide the mouse cursor when typing (only works in GUI).
		set guioptions-=T	" Don't show the toolbar in gvim.
		set guioptions-=m	" Don't show the menubar in gvim.
		set guicursor+=i-ci:ver50-Cursor/lCursor	" Make the insert cursor wider than the default.
else " Running in terminal
		set background=dark	" Background is dark so highlight syntax with light colours.
		set t_Co=16			" Number of colours that the terminal supports. This looks nice on mine...
		" Don't use underline to hightlight current line in terminal; use a background colour.
		if &cursorline
			highlight CursorLine   cterm=NONE ctermbg=DarkGrey
		endif
		" Match column highlighting to row highlighting (doesn't show up for me if not explicitly set).
		if &cursorcolumn
			highlight CursorColumn cterm=NONE ctermbg=DarkGrey
		endif
endif


"===== MS-WINDOWS SETTINGS =============
if has('win32') || has('win64')		" I'm not sure I need these settings; they're not that compelling.
	source $VIMRUNTIME/mswin.vim	" Just remaps CTRL-C/V/X/Z, I think.
	behave mswin					" Just changes some mouse-selection settings.
	set guifont=Lucida_Console:h10	" Looks better than the default.
endif


"===== FILES: tmp, backup, undo ========
set writebackup				" Write a backup when saving a file...
set nobackup				" ...but delete the backup upon successful completion of the save.
set backupdir=$HOME/.vim/_backup
set backup
set directory=$HOME/.vim/_tmp
set undofile
set undodir=$HOME/.vim/_undo


"===== KEY-MAPPINGS ====================
"_____Text manipulation_____
" Interact with system clipboard.
noremap <Leader>y "+y
noremap <Leader>yy "+yy
noremap <Leader>Y "+y$
noremap <Leader>p "+p
noremap <Leader>P "+P
" Make shift-insert work like in Xterm.
noremap  <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
" Y yanks to end of line (analogous to D for delete).
nnoremap Y y$
" Delete to the black-hole register.
nnoremap <Leader>d "_d
" Delete to the black-hole register.
nnoremap <Leader>x "_x
"Bubble single lines (http://vimcasts.org/episodes/bubbling-text).
nnoremap <C-S-Up> ddkP
nnoremap <C-S-Down> ddp
"Bubble multiple (visually-selected) lines (http://vimcasts.org/episodes/bubbling-text).
vnoremap <C-S-Up> xkP`[V`]
vnoremap <C-S-Down> xp`[V`]
" Hard linebreak at cursor (from and remaining in normal mode).
nnoremap <Leader><CR> i<CR><ESC>
" Blank line below/above current (from and remaining in normal mode).
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
" Toggle paste mode to paste properly indented text in the terminal. Not needed for gvim.
" This echoes the paste mode to the status line as well. See also 'set togglepaste' above.
nnoremap <silent> <F3> :set invpaste paste?<CR>
" Insert date.
nnoremap <Leader>date "=strftime("%Y-%m-%d")<CR>P

"_____Extra-textual info/visibility_____
" Use 'kj' to get out of insert mode into normal mode.
inoremap kj <ESC>
" Swap ':' and ';' in normal mode and visual mode
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
" Toggle absolute/relative line-numbering
nnoremap <Leader>num :call g:ToggleNumberMode()<CR>
noremap <C-V> :echo "Use \<Leader\>p to paste from system clipboard."<CR>
noremap <Leader>l :set list!<CR>
noremap <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <Leader>R :RainbowParenthesesToggle<CR>
noremap <F8> :execute 'TagbarToggle'<CR>

"_____Movement_____
" Make jk work screen-line-wise.
nnoremap j gj
nnoremap k gk
" Make arrow keys work (screen-line-wise) in visual mode.
vnoremap <Left> h
vnoremap <Right> l
vnoremap <Up> gk
vnoremap <Down> gj

"_____Searching_____
" 'Very magic' (:help \v) regexes (less escaping) for '/' and '?' searches.
nnoremap / /\v
xnoremap / /\v
nnoremap ? ?\v
xnoremap ? ?\v
" See discussion at http://stackoverflow.com/questions/3760444/in-vim-is-there-a-way-to-set-very-magic-permanently-and-globally
" I usually use '#' as the delimiter in substitutions.
cnoremap %s# %smagic#
cnoremap >s# >smagic#
nnoremap :g/ :g/\v
nnoremap :g// :g//
" Clear search highlights, including from :Search (MultipleSearch plugin)
nnoremap <Leader>/ :nohlsearch \| :SearchReset<CR>

"===== COMMAND ALIASES =================
" These typo fixes are fine but note that any arguments will not get passed through.
command! W w
command! WQ wq
command! Wq wq
command! Q q

"===== AUTOCOMMANDS ====================

" Work: biolog-specific settings: never tabs, always spaces, tab=2 spaces.
augroup BIOLOG
	autocmd! BIOLOG
	autocmd! BufRead,BufNewFile biolog.txt set expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END

" Type detection for JSON files.
augroup JSON
	autocmd! JSON
	autocmd! BufRead,BufNewFile *.json set filetype=json
augroup END

" Python as per PEP 8 (http://www.python.org/dev/peps/pep-0008/).
augroup PYTHON
	autocmd! PYTHON
	" Use 4 spaces for indentation and latin1 as encoding.
	autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 enc=latin1
	" And work's python coding convention: spaces instead of tabs.
	autocmd FileType python setlocal expandtab
augroup END

augroup VIMRC
	" Unload group before reloading. (See Learn Vimscript the Hard Way.)
	autocmd! VIMRC
	autocmd bufwritepost $MYVIMRC source %  " Automatically reload .vimrc (this file) when saving it.
	autocmd bufwritepost $MYVIMRC AirlineRefresh	" Otherwise (only for vimrc) airline loses colours.
augroup END

" Pretty-print (indent) XML with eg. gg=G - Requires xmllint in $PATH
augroup XML_INDENT
	autocmd! XML_INDENT
	autocmd! FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END

"===== FUNCTIONS =======================
" Toggle between absolute and relative line-numbering. I have this mapped to <Leader>num
function! g:ToggleNumberMode()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set nonumber
		set relativenumber
	endif
endfunc

function! g:NaturalSort(i, j)
	return (a:i+0) - (a:j+0)
endfunc

"===== PLUGIN SETTINGS =================
"_____vim-airline_____
"let g:airline#extensions#tabline#enabled = 1

"_____vim-startify_____
let g:startify_bookmarks = [ $HOME.'/.vimrc' ]
let g:startify_skiplist = [
		\ '^/tmp',
		\ 'COMMIT_EDITMSG',
		\ '^/usr/share/vim/vim7./doc/.*',
		\ ]

"===== ABBREVIATIONS ===================
"_____Spelling corrections_____
abbr becuase because
abbr binaires binaries
abbr execpt except
abbr mabye maybe
abbr prelfight preflight
abbr taht that
abbr teh the
abbr verison version

