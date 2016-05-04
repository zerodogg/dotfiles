" .vimrc for Eskild Hustvedt

" Key bindings set here:
" <Leader> is space
" F10        - Toggle paste mode
" F2         - make
" F9         - toggle scrollbind
" W          - Write (in normal mode)
" ,#         - comment
" ,u         - uncomment
" C-p        - Open up the file searcher with unite
" C-t        - Open up a new tab with the unite searcher open
" <Leader>d  - git diff on the current file
" <Leader>b  - Open a buffer explorer
" <Leader>f  - Open a file explorer
" <Leader>s  - Open a search window (for the current buffer)
" <Leader>m  - Open the MRU
" <Leader>o  - Open up the unite file searcher
" <Leader>y  - copy to system clipboard
" <Leader>p  - paste from system selection clipboard
" <Leader>P  - paste from system clipboard

" Use Vim settings, not vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

"NeoBundle boilerplate scripts-----------------------------{{{1
" Install: mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"}}}

" Local RC file (.head-version) {{{
if filereadable(glob("~/.vimrc_local.head"))
	source ~/.vimrc_local.head
endif "}}}

" Bundles"{{{
    " Additional and improved filetypes {{{
        " Better markdown support
NeoBundle 'tpope/vim-markdown'
        " iCalendar syntax
NeoBundle 'vim-scripts/icalendar.vim'
        " Enhanced po-editing
NeoBundle 'vim-scripts/po.vim--Jelenak'
        " LaTeX support
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
        " GTK and SQlite hilight
NeoBundle 'vim-scripts/gtk-vim-syntax'
NeoBundle 'vim-scripts/sqlite_c'
        " Ruby syntax
NeoBundle 'vim-ruby/vim-ruby'
        " An excellent outline format for vim
NeoBundle 'vimoutliner/vimoutliner.git'
        " Table-like CSV view
NeoBundleLazy 'chrisbra/csv.vim', { 'filetypes':'csv' }
        " systemd syntax
NeoBundle 'Matt-Deacalion/vim-systemd-syntax'
        " dokuwiki syntax
NeoBundle 'nblock/vim-dokuwiki'
        " Perl (also loads perlomni later)
NeoBundleLazy 'zerodogg/vim-perl', { 'branch':'method-signatures-support', 'filetypes':[ 'perl' ] }
NeoBundleLazy 'vim-perl/vim-perl', { 'filetypes':[ 'perl6' ], 'name':'vim-perl6' }
NeoBundle 'zerodogg/vim-mason'
        " Jinja2 syntax
NeoBundle 'glench/vim-jinja2-syntax'
        " todo.txt
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'elentok/todo.vim'
        " Web (HTML5, JavaScript, JSON, CSS, plus SCSS, tag auto-close,
        "  mustache, eco templates)
NeoBundle 'othree/html5.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'elzr/vim-json'
NeoBundleLazy 'amirh/HTML-AutoCloseTag', { 'filetypes':'html' }
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'AndrewRadev/vim-eco'
NeoBundle 'JulesWang/css.vim' "}}}
    " Programming and editing utilities {{{
            " Git utilities
NeoBundle 'tpope/vim-fugitive.git', { 'augroup' : 'fugitive'}
if(v:version < 702)
    NeoBundle 'tpope/vim-git'
end
            " Clean up whitespace
NeoBundle 'bronson/vim-trailing-whitespace'
            " Validate source
NeoBundleLazy 'scrooloose/syntastic.git', { 'insert' : 1 }

            " Align anything (:Tabularize)
NeoBundleLazy 'godlygeek/tabular.git', { 'commands': 'Tabularize' }
    " Various
            " solarized colors
NeoBundle 'altercation/vim-colors-solarized.git'
            " support for async actions
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
    " Manpage support
NeoBundleLazy 'jez/vim-superman',{'commands': 'SuperMan'}
            " The vim wiki
NeoBundleLazy 'zerodogg/vimwiki', {
                \ 'branch':'solarized',
                \ 'mappings' : '<Plug>Vimwiki',
                \ 'filename_patterns': '\.wiki$',
                \ }
        " a shell inside vim
NeoBundleLazy 'shougo/vimshell', {
              \ 'depends' : 'Shougo/vimproc.vim',
              \ 'autoload' : {
              \   'commands' : [{ 'name' : 'VimShell',
              \                   'complete' : 'customlist,vimshell#complete'},
              \                 'VimShellExecute', 'VimShellInteractive',
              \                 'VimShellTerminal', 'VimShellPop'],
              \   'mappings' : '<Plug>'
              \ }}
        " Distraction-free writing
NeoBundleLazy 'junegunn/goyo.vim', {'autoload': {'commands': ['Goyo']}}
        " :SudoWrite
NeoBundleLazy 'chrisbra/SudoEdit.vim', { 'commands':[ 'SudoWrite', 'SudoRead' ] }
        " interface to files, buffers etc.
NeoBundle 'shougo/unite.vim'
        " MRU for unite
NeoBundle 'shougo/neomru.vim'
        " vim-based file browser
NeoBundleLazy 'shougo/vimfiler.vim', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'commands' : [
      \         { 'name' : ['VimFiler', 'Edit', 'Write'],
      \           'complete' : 'customlist,vimfiler#complete' },
      \         'Read', 'Source'],
      \ 'mappings' : '<Plug>',
      \ 'explorer' : 1,
      \ } "}}}
    " Completion {{{
if has('lua') && has('patch-7.3.885') && !exists('_vimrc_no_complete')
            " Base completion
    NeoBundleLazy 'shougo/neocomplete.vim'
            " Perl omni completion
    NeoBundleLazy 'c9s/perlomni.vim', { 'filetypes':'perl' }
            " Snippets support
    NeoBundle 'Shougo/neosnippet'
            " Snippets content
    NeoBundle 'zerodogg/neosnippet-snippets'
end "}}}
"}}}

" Final NeoBundle boilerplate"{{{
" Required:
call neobundle#end()

"End NeoBundle Scripts-------------------------
"}}}

" Vim settings"{{{

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Switch on autoindent
set autoindent
filetype plugin indent on
" Enable the matchit plugin (vim 6.x+)
runtime macros/matchit.vim
" Switch syntax highlighting and highlighting of the last used search
" pattern on.
syntax on
set hlsearch
" Enable smart tab
set smarttab
" Enable enhanced command-line completion
set wildmenu
" Wrap text
set wrap
" Fold at syntax level
set foldmethod=syntax
" Don't fold too much by default. This is overridden for some filetypes.
set foldnestmax=2
" Output a pretty title
set title
set titlestring=Vim:\ %t%m%r
" Default everything to utf-8
set fileencoding=utf-8
set encoding=UTF-8
" Keep a backup file
set backup
" Keep 250 lines of command line history
set history=250
" Show the cursor position at all times
set ruler
" Display incomplete commands
set noshowcmd
" Do incremental searching
set incsearch
" Indenting looks nicer with this
set tabstop=4 shiftwidth=4 softtabstop=4
" Expand tabs
set expandtab
" Scroll if we're 5 or less lines near the top/bottom of the screen
set scrolloff=5
" A bit more paranoid about saving the swap file
set updatecount=100
" Ignore these files
set wildignore=*.o,*~,*.swp,*.tmp
" Don't scan all included files during autocomplete (ends up being rather
" slow)
set complete-=i
" Just to be clear, I want xterm-style behaviour
behave xterm
" Force-enable bce under screen
if &term == "screen"
    set term=screen-bce
elseif &term == "screen-256color"
    set term=screen-256color-bce
endif
" Make some terminal changes when under screen
if &term == "screen" || &term == "screen-bce" || &term == "screen-256color" || &term == "screen-256color-bce"
	" Set the title using screen's functions instead of default which is
	" xterm
	set t_ts=k
	set t_fs=\
	" Make sure we use the alternate screen, this should always be on when
	" *I* am using screen anyway
	set t_ti=[?1049h
	set t_te=[?1049l
	" Fix broken end key on some boxes
	set t_@7=[4~
endif
" Close the taglist on selection
silent! let Tlist_Close_On_Select=1
" Jump to errors if syntastic finds them
silent! let g:syntastic_auto_jump=1
" Solarized colors
set bg=dark
set t_Co=16
silent! colorscheme solarized
" Standard hardcopy-font
silent! set printfont=Terminus\ 12
" Vim swapfile locations
" Default to ~/.vim/swap if it exists, otherwise use default vim paths.
set dir=~/.vim/swap,.,~/tmp/,/var/tmp,/tmp
" Only display one block to hilight indention levels
let g:indent_guides_guide_size = 1
" Set foldmethod to manual when in insert mode. Avoids slowdowns caused by
" vim constantly trying to open/close and update folds while typing.
autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm
" Ignore whitespace errors in unite et. al.
let g:extra_whitespace_ignored_filetypes = [ 'unite', 'vimfiler', 'vimshell', 'diff', 'gitcommit', 'mail', 'help', '' ]
" The vim wiki path
let g:vimwiki_list = [{'path': '~/Documents/wiki/'} ]
" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''
"}}}

" Keymappings and commands"{{{

let mapleader = "\<Space>"

" Map f2 to :w, :make, :cw so that we can check syntax with f2
map <F2> :w<CR>:make<CR>:cw<CR>
" Map <leader>d to git diff
map <leader>d :Gdiff<CR>
" Map F9 to scrollbind toggle
map <F9> :set scrollbind!<CR>
" Map ¤ (shift+4 on Norwegian keyboards) to <End> ($ is default, which I think
"  works on English keyboards, but that would require using alt here, which
"  isn't that easily accessible.)
map ¤ <END>
" Comment out the marked line(s) with #
map ,# :s/^/#/<CR><Esc>:nohlsearch<CR>
" Uncomming the marked line(s) that has #
map ,u :s/^#//<CR><Esc>:nohlsearch<CR>
" Grep for TODO and put it into the error win
command TODO :sil cclose | call setqflist([]) | exe 'g/TODO\|FIXME/caddexpr expand("%") . ":" . line(".") . ":" .getline(".")' | cw
" New tab
map <C-t> :tabnew<CR><Leader>m
" Ignore vim help files in neomru
silent! call unite#custom#source('neomru/file','ignore_pattern','^\(/usr/share/vim/\|.*\.vim/bundle\)')
" Open up the unite file searcher
nnoremap <expr> <Leader>o expand('~') == getcwd() ? ':Unite -ignorecase -start-insert neomru/file file_rec/async:~/Documents<cr>' : ':Unite -ignorecase -start-insert neomru/file file_rec/async:!<cr>'
" Open the MRU
nmap <Leader>m :Unite -start-insert -ignorecase neomru/file<CR>
" Toggle a file/dir browser
map <Leader>f :VimFiler -columns=type -toggle -split -winwidth=40<cr>
" Toggle a buffer explorer
map <Leader>b :Unite -buffer-name=buffers -vertical -direction=botright -toggle -winwidth=40 buffer<cr>
" Toggle a search window
nmap <Leader>s :Unite -custom-line-enable-highlight -start-insert -ignorecase line<CR>
" Toggle a grep/ack/ag window
nnoremap <Leader>g :<C-u>Unite -no-split -silent -buffer-name=ag grep<CR>
" Use shift-insert as MiddleMouse, ie. to paste (like in xterm)
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" Use F10 to toggle paste mode
set pastetoggle=<F10>
" I :w often - this is quicker
nnoremap <leader>w :w<CR>
" Copy to clipboard with <Leader>y, paste with <Leader>p
vmap <Leader>y "+y
nmap <Leader>p "*p
vmap <Leader>p "*p
nmap <Leader>P "+P
vmap <Leader>P "+P
" Start the vim wiki
nmap <Leader>ww <Plug>VimwikiIndex
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
" Disable Q-to-enter-Ex-mode
nnoremap Q <nop>
"}}}

" Autocommands"{{{

" Jump to the last known position on startup
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
" Wiki auto commit (based upon https://gist.github.com/rsommer/6614941db7af813772f8)
" requires python2-gitpython
function! CommitFileToGit()
python << EOF
import vim, git
curfile = vim.current.buffer.name
if curfile:
    try:
        repo = git.Repo(curfile)
        repo.git.add(curfile)
        repo.git.commit(m='Update {curfile}'.format(curfile=curfile))
    except (git.InvalidGitRepositoryError, git.GitCommandError):
        pass
EOF
endfunction
autocmd BufWritePost *.wiki call CommitFileToGit()
"}}}

" Filetype-specific settings"{{{1
" -- PO settings --"{{{
let g:po_translator="Eskild Hustvedt <i18n@zerodogg.org>"
let g:po_lang_team="Norwegian Nynorsk <i18n-no@lister.ping.uio.no>"
"}}}
" -- Perl settings --"{{{
" Enable perl folding by default
let perl_fold = 1
let perl6_fold = 1
" Highlight POD
let perl_include_pod = 1
" Compiler
autocmd FileType perl compiler perl
" Make settings
autocmd FileType perl setlocal makeprg=perl\ -c\ %
"}}}
" -- PHP settings --"{{{
" Enable PHP folding by default
let php_folding = 1
" Show SQL syntax in PHP strings
let php_sql_query=1
" Show HTML syntax in PHP strings
let php_htmlInStrings=1
" Show some more errors
let php_parent_error_close=1
let php_parent_error_open=1
" Hilight baselib stuff
let php_baselib=1
" ctp is php
autocmd BufNewFile,BufRead *.ctp set ft=php
" Make program settings
autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"}}}
" -- GIT settings --"{{{
autocmd FileType gitcommit setlocal foldmethod=manual
"}}}
" -- XML settings --"{{{
autocmd FileType xml setlocal makeprg=xmllint\ --noout\ %
autocmd FileType xml setlocal errorformat=%f\:%l%m
"}}}
" -- Java settings --"{{{
" This enables folding for java. Not very pretty folding, but at least usable.
autocmd FileType java syn region myFold start="{" end="}" transparent fold
"}}}
" -- git commit --"{{{
autocmd FileType gitcommit setlocal tw=0
"}}}
" -- LaTeX settings --"{{{
let g:tex_fold_enabled=1
" Set ft
autocmd BufNewFile,BufRead *.tex set ft=tex
" Enable spell checking
autocmd FileType tex setlocal spell
set spelllang=nn,en
" Use default foldnestmax (20)
autocmd FileType tex setlocal foldnestmax=20
autocmd FileType tex setlocal tw=80
" Ignore a few chktex warnings
let g:syntastic_tex_chktex_args = '-n 8 -n 1 -n 44'
" Enable completion
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.tex = '\v\\\a*(ref|cite)\a*([^]]*\])?\{(|[^}]*,)'
"}}}
" --- Markdown settings ---"{{{
" Filetype detection
autocmd! BufRead,BufNewFile *.md setfiletype markdown
" Enable spell checking
autocmd FileType markdown setlocal spell spellcapcheck=off
" Textwidth for markdown
autocmd FileType markdown setlocal tw=79
"}}}
" --- Ruby settings ---"{{{
autocmd FileType ruby let g:syntastic_quiet_warnings=1
"}}}
" --- C/C++ settings ---"{{{
autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2
let c_no_comment_fold=1
let c_no_block_fold=1
let c_space_errors=0
let c_gnu=1
"}}}
" --- mail settings --"{{{
autocmd FileType mail setlocal foldmethod=manual
"}}}
" --- BASH settings ---"{{{
" Folding doesn't work very well, so use a basic one instead
let g:sh_fold_enabled=1
"}}}
" --- iCalendar settings ---"{{{
" Filetype detection
autocmd! BufRead,BufNewFile *.ics setfiletype icalendar
"}}}
" --- HTML ---"{{{
autocmd! FileType html syntax sync minlines=2000 maxlines=4000
" Use mason for HTML by default
autocmd BufNewFile,BufRead *.html set ft=mason nomodeline
" Additional common Mason files
autocmd BufNewFile,BufRead autohandler set ft=mason
autocmd BufNewFile,BufRead dhandler set ft=mason
autocmd BufNewFile,BufRead *.mas set ft=mason
autocmd BufNewFile,BufRead *.mjs set ft=mason
" Load the html ftplugin when using mason
autocmd FileType mason so $VIMRUNTIME/ftplugin/html.vim
"}}}
" --- JavaScript ---"{{{
au FileType javascript call JavaScriptFold()
"}}}
" --- Other filetype detection ---"{{{
autocmd BufNewFile,BufRead Makefile.cfg set ft=make
autocmd BufNewFile,BufRead *.run set ft=sh
autocmd BufNewFile,BufRead *.tt++ set ft=tt
autocmd BufNewFile,BufRead *.j2 set ft=jinja
"}}}
" --- Vimoutliner settings ---"{{{
" Use dark background, set the filetype, enable folding
autocmd BufNewFile,BufRead *.otl setlocal ft=votl foldlevel=0 spellcapcheck=off nospell
" Don't make fold text too short
silent! let g:vo_fold_length=79
"}}}
" --- SASS ---"{{{
autocmd! FileType scss syntax sync minlines=1000
"}}}
" --- vimwiki ---"{{{
autocmd! FileType vimwiki setlocal foldlevel=1 concealcursor=n conceallevel=2 tw=79
" Disable conceal in insert mode, and disable concealcursor after having been
" in insert mode
autocmd FileType vimwiki :autocmd InsertEnter <buffer> setlocal conceallevel=0
autocmd FileType vimwiki :autocmd InsertLeave <buffer> setlocal conceallevel=2 concealcursor=""
"}}}
" --- todo.txt ---"{{{
autocmd FileType todo nnoremap <script> <silent> <buffer> <leader>S :sort<CR>
autocmd FileType todo nnoremap <script> <silent> <buffer> <leader>S@ :sort /.\{-}\ze@/ <CR>
autocmd FileType todo nnoremap <script> <silent> <buffer> <leader>S+ :sort /.\{-}\ze+/ <CR>
autocmd FileType todo nnoremap <script> <silent> <buffer> <leader>b :call TodoTxtPrioritizeAdd('B')<CR>
"}}}
"1}}}

" GUI settings {{{1

if has("gui_running")
	" I don't like blinking cursors - and I like my block cursor
	set guicursor+=a:blinkon0-block
	" Console dialogs instead of GUI ones,
	" Remove all scrollbars+toolbar+menubar
	set go+=cg go-=r go-=R go-=l go-=L go-=T go-=e go-=m
	" Hide the mouse when typing
	set mousehide
	" I like Terminus
	set guifont=Terminus\ 12
	" Start gvim in the largest size possible
	set columns=999 lines=999
endif
" }}}

" Typos and other automatic substitutions{{{1

" Typos
abbreviate tempalte template
abbreviate fuction function
abbreviate =< <=
" These won't get applied in most cases, but won't hurt to
" have them.
abbreviate if( if (
abbreviate }else{ }<CR>else<CR>{
abbreviate ){ )<CR>{
abbreviate ÆÆ **
abbreviate '/ÆÆ' '/**'
abbreviate serach search

" This remaps a multi-byte space character into a normal one
imap   <space>

" Per-filetype typos and fixes
fun PerFT_typo()
	if &ft == 'perl'
		abbreviate elseif elsif
		abbreviate elif elsif
		" typo of ->
		imap -< ->
	elseif &ft == 'php'
		abbreviate elsif elseif
		abbreviate elif elseif
		" typo of ->
		imap -< ->
		" Used to perl, so switch some common perl things into their
		" PHP version
		abbreviate # //
		abbreviate eq ==
		abbreviate sub function
	elseif &ft == 'c' || &ft == 'cpp'
		abbreviate elsif else if
		abbreviate elif else if
		abbreviate elseif else if
		abbreviate eq ==
	endif
endfun
autocmd BufRead,BufNewFile * :call PerFT_typo()
"}}}

" NeoComplete{{{1
if neobundle#is_installed('neocomplete.vim')
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
    "
    " Adapt the menu for solarized dark
    highlight Pmenu ctermfg=0 ctermbg=10

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#close_popup() . "\<CR>"
    endfunction
end
" }}}

" Local RC file (main/tail-version), can be used for instance to fix backspace on old boxes {{{
if filereadable(glob("~/.vimrc_local"))
	source ~/.vimrc_local
endif "}}}
" vim: set foldmethod=marker :
