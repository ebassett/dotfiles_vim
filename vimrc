scriptencoding utf-8	" See http://superuser.com/questions/556915 and elsewhere.
set encoding=utf-8
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
Plugin 'tpope/vim-abolish'			" Easily search for, substitute, and abbreviate multiple variants of a word.
Plugin 'bling/vim-airline'			" Powerful yet light statusline. :help airline for config options.
"Plugin 'vim-scripts/AutoClose'		" Auto-closes (, [, {, \", '.
Plugin 'ebassett/AutoClose'		" Auto-closes (, [, {, \", '.
Plugin 'gioele/vim-autoswap'		" Deal more intelligently with .swp files.
Plugin 'Lokaltog/vim-easymotion'	" Super-quick jump to word/line/search-term/etc. :help easymotion
Plugin 'tpope/vim-eunuch'			" Vim sugar for some Unix shell commands, eg. :Rename, :SudoWrite.
"Plugin 'tpope/vim-fugitive'		" git plugin. See http://vimcasts.org/blog/2011/05/the-fugitive-series/
Plugin 'gergap/vim-konsole'			" KDE helper for autoswap
Plugin 'vim-scripts/matchit.zip'	" Use '%' to jump between opening/closing HTML/XML tags, if/else-if/else, etc.
Plugin 'techlivezheng/vim-plugin-minibufexpl'  " Tabline for open buffers.
Plugin 'vim-scripts/MultipleSearch'	" Highlight multiple search terms in different colours. :help MultipleSearch
Plugin 'scrooloose/nerdtree'		" File explorer. (:help nerdtree) I have :NERDTreeToggle mapped to <F2>
Plugin 'vim-scripts/python_match.vim' " Use '%' to jump between Python if/elif/else, try/except/catch, etc.
Plugin 'tpope/vim-ragtag'			" Convenience for XML/HTML tags.
Plugin 'kien/rainbow_parentheses.vim'  " Colours parentheses and brackets according to nesting.
Plugin 'tpope/vim-repeat'			" Lets '.' (repeat) work with (supported) plugin commands.
"Plugin 'msanders/snipmate'			" Code snippets.
Plugin 'tpope/vim-speeddating'		" Use CTRL-A/CTRL-X to increment/decrement dates, times, and more.
Plugin 'mhinz/vim-startify'			" Startup screen with recently-used files, sessions, bookmarks, etc.
Plugin 'tpope/vim-surround'			" Wrap existing text in quotes, brackets, tags, etc.
Plugin 'majutsushi/tagbar'			" Sidebar for coding symbols (ctags).
Plugin 'tomtom/tcomment_vim'		" Toggle line-/block-wise comments.
Plugin 'tpope/vim-unimpaired'		" Short normal-mode aliases for commonly-used ex commands.
Plugin 'ebassett/vimwiki'			" Personal wiki.

"-- vim.org/scripts repos --
"Example:	Plugin 'python_match.vim'

"-- non-github repos --
"Example:	Plugin 'git://git.wincent.com/command-t.git'

"-- *local* files --
"Example:	Plugin 'file:///Users/gmarik/path/to/plugin'

call vundle#end()
filetype plugin indent on  " Required. Equivalent to 'filetype on' AND 'filetype plugin on' AND 'filetype indent on'.


"===== GENERAL =========================
syntax on				" I believe this has to occur early in the vimrc.
set fileformats+=mac	" Might as well add this. (Defaults: unix,dos under unix; dos,unix under Windows.)

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
set nrformats-=octal	" With CTRL-A/X inc-/decrementing, don't treat leading zero as octal.
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
set listchars=tab:▸—,trail:·,eol:¶,extends:×,precedes:÷,nbsp:°  " Chars for non-printing chars (if 'list' is set).
set showbreak=\|		" String to indicate soft-wrapped lines.
set noerrorbells		" Suppress audible bell.
set novisualbell		" Suppress visual bell. cf. t_vb
set history=100			" Remember last n commands/searchs/etc.

"_____Movement_____
set backspace=indent,eol,start
set nostartofline		" Don't always move cursor to beginning of line; leave it in the column I was on.
set scrolloff=3			" Minimum number of screen lines to keep above and below the cursor.
set sidescrolloff=5		" Minimum number of characters to keep when scrolling long lines.
set whichwrap=b,s,<,>,[,],~	" Allow these to traverse lines: <BS>, <SPACE>, <LEFT>, <RIGHT>, ~.
set matchpairs+=<:>		" Make % jump between these pairs of characters.

"_____Searching_____
set gdefault			" Default is substitutions globally on lines (g option). Add explicit g to reverse.
set ignorecase			" Necessary for smartcase to work.
set smartcase			" Case-sensitive if any capitals in search term, else insensitive. '\c' forces insensitive; '\C' force sensitive.
set incsearch			" Incremental search: start matching as soon as you start typing search term.
set hlsearch			" Highlight search matches.
set nowrapscan			" Do NOT continue search from top when you reach the bottom.
set wildmenu			" Autocompletion stuff.
set wildmode=longest,list,full
set wildignore+=.git
set wildignore+=*~,*.bak,*.class,*.pyc,*.sw?

"_____Mousing_____
set mouse=a				"Allow mouse in all modes.

"_____Buffers_____
set hidden				" Do NOT require a buffer to be saved before switching to a different one.
set splitbelow
set splitright

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
		set t_Co=256		" Number of colours that the terminal supports. This looks nice on mine...
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
	set guifont=Consolas:h10,Lucida_Console:h10	" First choice, fallback.
endif


"===== FILES: tmp, backup, undo, viminfo ========
" Trailing double-slash prods Vim to keep full path, to avoid collisions.
set backupdir=$HOME/.vim/_backup//
set writebackup				" Write a backup when saving a file...
set nobackup				" ...but delete the backup upon successful completion of the save.
set directory=$HOME/.vim/_tmp//
set undofile
set undodir=$HOME/.vim/_undo//
set viminfo+=n$HOME/.vim/viminfo	" Platform-independent name&location, not .viminfo vs _viminfo


"===== KEY-MAPPINGS ====================
"_____Text manipulation_____
" Interact with system clipboard.
noremap <Leader>y  "+y
noremap <Leader>yy "+yy
noremap <Leader>y$ "+y$
noremap <Leader>Y  "+y$
noremap <Leader>p  "+p
noremap <Leader>P  "+P
" Make shift-insert work like in xterm. (Uses '*' register.)
noremap  <S-Insert> <MiddleMouse>
noremap! <S-Insert> <MiddleMouse>
" Y yanks to end of line (analogous to D for delete, C for change).
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
" Insert short/long date (ie. write it to clipboard and then paste that in).
nnoremap <Leader>date "=strftime("%Y-%m-%d")<CR>p
nnoremap <Leader>DATE "=strftime("%A %d %B %Y %H:%M:%S")<CR>p
" No-op keys that cause more trouble than they're worth when hit accidentally.
"   Normally starts ex mode
nnoremap Q <nop>
"   Normally opens man page for word under cursor
nnoremap K <nop>
" Tab in normal mode does nothing; make it switch to insert mode, tab, return to normal mode. BREAKS CTRL-I navigation
"nnoremap <TAB> i<TAB><ESC>l
" Space in normal mode does nothing useful; make it switch to insert mode, space, return to normal mode.
"nnoremap <SPACE> i<SPACE><ESC>l
" Backspace in normal mode does nothing useful; make it switch to insert mode, backspace, return to normal mode.
"nnoremap <BS> i<BS><ESC>l

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
"noremap <C-v> :echo "Use \<Leader\>p to paste from system clipboard."<CR>
noremap <Leader>l :setlocal list!<CR>
noremap <F2> :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <Leader>R :RainbowParenthesesToggle<CR>
noremap <F8> :execute 'TagbarToggle'<CR>

"_____Movement_____
" Swap line-wise vs row-wise behaviour of {j|k} and g{j|k}
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
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
nnoremap <Leader><Space> :nohlsearch \| :Search \| :SearchReset<CR>
"Shortcut for :VWS (VimWikiSearch)
nnoremap <Leader>? :VWS ##<Left>

"===== COMMAND ALIASES =================
" See http://blog.sanctum.geek.nz/vim-command-typos
command! -bang -nargs=? -complete=file E e<bang> <args>
command! -bang -nargs=? -complete=file W w<bang> <args>
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang -nargs=? -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
" Speed up vimgrep (ignore Autocommand events when opening files for grepping)
command! -nargs=* Vimgrep  noautocmd vimgrep <args>


"===== AUTOCOMMANDS ====================

" Work: *.config files are XML
augroup CONFIG
	autocmd! CONFIG
	autocmd BufRead,BufNewFile  *.config  set filetype=xml
augroup END

" EJB: Settings for my notes to myself: never tabs, always spaces, tab=2 spaces.
augroup EJB
	autocmd! EJB
	autocmd BufRead,BufNewFile  Captains.log,Captain's.log,*.wiki setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
	autocmd BufRead,BufNewFile  Captains.log,Captain's.log,*.wiki syn match Todo "\<\(TODO\|EJB\)"
	autocmd BufRead,BufNewFile  Captains.log,Captain's.log,*.wiki setlocal commentstring=//\ %s
	" Scroll to end of file on opening, then find the last non-blank line.
	autocmd BufRead             Captains.log,Captain's.log,*.wiki :normal! G{}
	autocmd BufRead             Captains.log,Captain's.log,*.wiki let g:autoclose_openspecial = 0
augroup END

augroup HELP_IN_TABS
	autocmd! HELP_IN_TABS
	autocmd BufEnter  *.txt  call HelpInNewTab()
augroup END

" Type detection for JSON files.
augroup JSON
	autocmd! JSON
	autocmd BufRead,BufNewFile  *.json  set filetype=javascript
augroup END

" Python as per PEP 8 (http://www.python.org/dev/peps/pep-0008/).
augroup PYTHON
	autocmd! PYTHON
	" Use 4 spaces for indentation and latin1 as encoding.
	autocmd FileType  python  setlocal shiftwidth=4 softtabstop=4 tabstop=4 encoding=latin1
	" And work's python coding convention: spaces instead of tabs.
	autocmd FileType  python  setlocal expandtab
augroup END

augroup VIMRC
	autocmd! VIMRC
	autocmd BufWritePost  $MYVIMRC  source %  " Automatically reload .vimrc (this file) when saving it.
	autocmd BufWritePost  $MYVIMRC  AirlineRefresh	" Otherwise (only for vimrc) airline loses colours.
augroup END

" Pretty-print (indent) XML with eg. gg=G - Requires xmllint in $PATH
augroup XML_INDENT
	autocmd! XML_INDENT
	autocmd FileType  xml  setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END

"===== FUNCTIONS =======================
" Open help files in new tabs. cf. HELP_IN_TABS augroup
function! HelpInNewTab()
	if &buftype == 'help'
		execute "normal \<C-W>T"
	endif
endfunction

" Sort characters as characters, numbers as numbers
" Usage: let sortedlist = sort(mylist, "NaturalSort")
function! g:NaturalSort(i, j)
	return (a:i+0) - (a:j+0)
endfunction

" Toggle between absolute, relative, and no line-numbering. I have this mapped to <Leader>num
function! g:ToggleNumberMode()
	if(&number == 1)
		set relativenumber
		set nonumber
	elseif(&relativenumber == 1)
		set norelativenumber
	else
		set number
	endif
endfunction


"===== PLUGIN SETTINGS =================
"_____vim-airline_____
"let g:airline#extensions#tabline#enabled = 1

"_____AutoClose_____
"let g:autoclose_special_curlybrace = 0

"_____vim-startify_____
let g:startify_bookmarks = [
		\ $HOME."/.vimrc",
		\ $HOME."/.bashrc",
		\ $HOME."/.bash_aliases",
		\ $HOME."/vimwiki/index.wiki",
		\ $HOME."/CaptainsLog/Captain's.log",
        \ ]
let g:startify_skiplist = [
		\ '^/tmp',
		\ 'COMMIT_EDITMSG',
		\ $HOME.'/vimwiki/.*\.wiki',
		\ '^/usr/share/vim/vim7./doc/.*',
		\ ]

"_____vimwiki_____
let g:vimwiki_use_mouse = 1
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {
        \ 'awk': 'awk',
        \ 'bat': 'dosbatch',
        \ 'batch': 'dosbatch',
        \ 'c#': 'cs',
        \ 'c++': 'cpp',
        \ 'c-sharp': 'cs',
        \ 'crontab': 'crontab',
        \ 'c': 'c',
        \ 'cpp': 'cpp',
        \ 'cs': 'cs',
        \ 'csharp': 'cs',
        \ 'fstab': 'fstab',
        \ 'html': 'html',
        \ 'ini': 'dosini',
        \ 'java': 'java',
        \ 'json': 'json',
        \ 'make': 'make',
        \ 'man': 'man',
        \ 'markdown': 'markdown',
        \ 'perl': 'perl',
        \ 'python': 'python',
        \ 'registry': 'registry',
        \ 'ruby': 'ruby',
        \ 'samba': 'samba',
        \ 'scheme': 'scheme',
        \ 'sed': 'sed',
        \ 'sh': 'sh',
        \ 'sql': 'sql',
        \ 'sudoers': 'sudoers',
        \ 'sysctl': 'sysctl',
        \ 'wget': 'wget',
        \ 'xf86conf': 'xf86conf',
        \ 'xhtml': 'xhtml',
        \ 'xml': 'xml',
        \ }
let g:vimwiki_list = [wiki]


"===== ABBREVIATIONS ===================
"_____Spelling corrections_____
iabbr becuase because
iabbr binaires binaries
iabbr execpt except
iabbr mabye maybe
iabbr prelfight preflight
iabbr taht that
iabbr teh the
iabbr varaible variable
iabbr varaibles variables
iabbr verison version

