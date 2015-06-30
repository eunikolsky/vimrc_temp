""" setting up vundle
set nocompatible        " Disable compatibility with vi
filetype off            " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" bundles:

" surround.vim: quoting/parenthesizing made simple
Bundle 'tpope/vim-surround'
" repeat.vim: enable repeating supported plugin maps with "."
Bundle 'tpope/vim-repeat'
" Zenburn is a low-contrast color scheme for Vim
"Bundle 'jnurmine/Zenburn'
" Vim plugin for the Perl module / CLI script 'ack'
Bundle 'mileszs/ack.vim'
" Vim plugin for intensely orgasmic commenting
Bundle 'scrooloose/nerdcommenter'
" A tree explorer plugin for vim
Bundle 'scrooloose/nerdtree'
" unimpaired.vim: pairs of handy bracket mappings
Bundle 'tpope/vim-unimpaired'
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'
" Markdown syntax highlight for Vim editor with snippets support
Bundle 'hallison/vim-markdown'
" Elegant buffer explorer - takes very little screen space
"Bundle 'fholgado/minibufexpl.vim'
" Syntax checking hacks for vim
Bundle 'scrooloose/syntastic'
" A simple Vim plugin to switch segments of text with predefined replacements
Bundle 'AndrewRadev/switch.vim'
" VIM syntax file for AsciiDoc files
"Bundle 'dagwieers/asciidoc-vim'
" Vim/Ruby Configuration Files
Bundle 'vim-ruby/vim-ruby'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Bundle 'kien/ctrlp.vim'
" Vim plugin for Todo.txt
Bundle 'freitass/todo.txt-vim'
" sleuth.vim: Heuristically set buffer options
Bundle 'tpope/vim-sleuth'
" A code-completion engine for Vim
"Plugin 'Valloric/YouCompleteMe'

" The Command-T plug-in for VIM provides an extremely fast, intuitive
" mechanism for opening files with a minimal number of keystrokes.
"Bundle 'git://git.wincent.com/command-t.git'

" snipMate.vim aims to be an unobtrusive, concise vim script that implements
" some of TextMate's snippets features in Vim.
Bundle 'snipMate'
" matchit.zip : extended % matching for HTML, LaTeX, and many other languages
Bundle 'matchit.zip'
" Buffer Explorer / Browser
Bundle 'bufexplorer.zip'
" DrawIt! : Ascii drawing plugin: lines, ellipses, arrows, fills, and more!
Bundle 'DrawIt'


filetype plugin indent on   " required!

"^^ setting up vundle


"let mapleader=","       " change leader from \ to ,
"nnoremap ,, ,
"xnoremap ,, ,
"onoremap ,, ,

set ruler               " Display the cursor's position all the time
set foldmethod=marker   " Folding by {{{ and }}} markers
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo    " These commands open folds
set showcmd             " Show partial command in the status line
set showmatch           " Show matching brackets
set background=dark     " Set colorscheme for a dark color terminal
set number              " Line numbering
"set relativenumber      " Relative numbering (vim 7.4+)

set ignorecase          " Do case insensetive matching
set smartcase           " ignore case if search patter is all lowercase, case-sensitive otherwise
set incsearch           " Incremental searching
set hlsearch            " Enable highlight of the found variants
"set gdefault            " search/replace globally on a line by default

set scrolljump=1
set scrolloff=1

set termencoding=utf-8  " Set the terminal encoding
set hidden              " Don't unload the buffer when you switch to another one
set backspace=indent,eol,start whichwrap+=<,>,[,]   " Allows to use backspace instead of 'x'
""set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
""set statusline=%<%f%h%m%r%=format=%{&fileformat} file=%{&fileencoding} enc=%{&encoding} %b 0x%B %l,%c%V %P
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
" for syntastic
set stl+=\ \|\ %#warningmsg#\ %{SyntasticStatuslineFlag()}\ %*
set laststatus=2
set ch=2                " Makes command line two lines high
set fo+=cr              " Fix <ENTER> for comment
set sessionoptions=curdir,buffers,tabpages
"set wildmode=list:longest,full  " completion mode
set wrap                " Enable line wrap
set linebreak           " Line wrap by words, not by letters
"set lazyredraw          " Don't update the display while executing macros
set showmode            " Show current mode
set wildmenu            " Enable enhanced command-line completion
set vb                  " Set visual bell
set history=500         " Keep some stuff in the history
"set textwidth=80
set title               " change the terminal's title

set shiftwidth=4        " Set default tab size, number of spaces for autoindenting
set tabstop=4           " a tab is 4 spaces
set softtabstop=4
set smarttab            " Enable smart tabs
set expandtab           " Transform <TAB> to <SPACE>
set shiftround          " use multiple of shiftwidth when indenting with < and >
set autoindent          " Set auto indentation when typing
set copyindent          " copy the previous indentation on autoindenting

set colorcolumn=81      " Highlight the 80th column

set list                " highlight whitespaces
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.     " disable highlighting in html&xml

set splitright          " new vertical split will open to the right by default
set splitbelow          " new horizontal split will open below by default

"set relativenumber      " line numbers are relative to the current one
"set undofile            " allow to undo after reopening files

set spell               " Turn on spell check
set spelllang=en_us,ru_yo
set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/ru.utf-8.add
" from http://hacktux.com/vim/spellcheck
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

let xml_tag_completion_map = ">>"

filetype on             " Get that filetype stuff happening
filetype plugin on
filetype indent on
syntax on               " Enable syntax highlight
set omnifunc=syntaxcomplete#Complete

" Jump to the last position when reopening the file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

" Saves the file w/o write access using sudo
: command! Wsudo set buftype=nowrite | silent execute ':%w !sudo tee %' | set buftype= | e! %

" https://coderwall.com/p/faceag
:com! FormatJSON %!python -m json.tool


" Spell checking menu
" http://ru.wikibooks.org/wiki/Vim#.D0.9F.D0.BE.D0.BB.D1.8C.D0.B7.D0.BE.D0.B2.D0.B0.D1.82.D0.B5.D0.BB.D1.8C.D1.81.D0.BA.D0.BE.D0.B5_.D0.BC.D0.B5.D0.BD.D1.8E_2
"set wildmenu
"set wcm=<Tab>
"
"menu SetSpell.ru  :set spl=ru spell<CR>
"menu SetSpell.en  :set spl=en spell<CR>
"menu SetSpell.off :set nospell<CR>
"map <F9> :emenu SetSpell.<Tab>
"
"imap <F10> <Esc> z=<CR>i
"map <F10> z=<CR>



" Macros

" composes the default commit message for new blogposts
"let @p='gg/title: Wy$ggiAdd a post about p:noh'
let @p='G?title: Wy$ggiAdd a post about p:noh'


" use perl's regex scheme
"nnoremap / /\v
"vnoremap / /\v


"*******************
"** Key Mappings ***
"*******************

" MAGIC! i.e., use ;w instead of :w to save the file
nnoremap ; :

" <F2> - fast save
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" <F3> - toggle paste mode
set pastetoggle=<F3>

" <F5> - buffers list
nmap <F5> \be
vmap <F5> <esc>\be
imap <F5> <esc>\be

" <F6> - the previous buffer
nmap <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" <F7> - the next buffer
nmap <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" <F10><F10> - toggle spell checking
nmap <F10><F10> :setlocal spell!<CR>

"" <Ctrl-N>,<v> - open the NerdTree
"nmap <C-N>v :NERDTree<cr>
"vmap <C-N>v <esc>:NERDTree<cr>i
"imap <C-N>v <esc>:NERDTree<cr>i

"" <Ctrl-N>,<x> - close the NerdTree
"nmap <C-N>x :NERDTreeClose<cr>
"vmap <C-N>x <esc>:NERDTreeClose<cr>i
"imap <C-N>x <esc>:NERDTreeClose<cr>i

" <Space> in normal mode scroll pages
nmap <Space> <PageDown>

" <C-F> for omni completion
imap <C-F> <C-X><C-O>

" <Ctrl-C> & <Ctrl-V> - Copy/Paste in "global clipboard"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" <Ctrl-Y> - remove current line
nmap <C-Y> dd
imap <C-Y> <esc>ddi

" <Ctrl-D> - duplicate current line
nmap <C-D> yyp
imap <C-D> <esc>yypi

" <Ctrl-X> - quit
nmap <C-X> :q<cr>


""" Useful stuff """

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" j and k go up and down logical lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Search&replace the word under the cursor
"nmap ; :%s/\<<C-R>=expand("<cword>")<cr>\>/

" < & > - make indentation for blocks
vmap < <gv
vmap > >gv

" Turn off the replace mode
"imap <Ins> <esc>i

" Hide the search results highlighting with double escape
nnoremap <silent> <ESC><ESC> :nohlsearch<CR>

" Let's make it easy to edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
" And to source this file as well
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" jump to next conflict marker in git
map <silent> <F8> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<cr>

" use ack
nnoremap <leader>a :Ack

nmap <leader>nt :NERDTreeToggle<cr>

" switch stuff with switch.vim plugin
nnoremap <silent> - :Switch<cr>
" in haskell, switch between the $ operator and parenthesis ()
" very error-prone ATM!
autocmd FileType haskell let b:switch_custom_definitions =
    \ [
    \   {
    \     '\$ \(.*\)$': '(\1)',
    \     '(\(.*\))': '$ \1'
    \   }
    \ ]

" in octave files, toggle a trailing semicolon, which triggers output mute
" from that command
autocmd FileType matlab let b:switch_custom_definitions =
    \ [
    \   {
    \     '\(.*\);\s*$': '\1',
    \     '\(.*\)\s*$': '\1;'
    \   }
    \ ]


" exit from insert mode with jj
inoremap jj <ESC>

" inserts the current page number in Preview.app
inoremap <silent> <F7> <C-R>=system("osascript -e 'tell app \"Preview\" to get name of front window' \| sed -E 's/.*page ([0-9]+).*/ \\1/' \| tr -d '\\n'")<CR>
inoremap <silent> <F8> <C-R>=system("echo -n -$(($(osascript -e 'tell app \"Preview\" to get name of front window' \| sed -E 's/.*page ([0-9]+).*/\\1/' \| tr -d '\\n') - 1))\\ ")<CR>

" Highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
" Highlight tabs between spaces
au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
au BufNewFile,BufRead * let b:mtabaftersp=matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)
" Disable the previous matches in help buffers
au BufEnter,FileType help call clearmatches()

autocmd FileType markdown inoremap >> &gt;

"" configure tags
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/qt4
"" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

function! MyBufEnter()
    " don't (re)store filepos for git commit message files
    if &filetype == "gitcommit"
        call setpos('.', [0, 1, 1, 0])
    endif
endfunction
au BufEnter * call MyBufEnter()


" vim -b : edit binary using xxd-format!
augroup binary
    au!
    au bufreadpre  *.bin let &bin=1
    au bufreadpost *.bin if &bin | %!xxd
    au bufreadpost *.bin set ft=xxd | endif
    au bufwritepre *.bin if &bin | %!xxd -r
    au bufwritepre *.bin endif
    au bufwritepost *.bin if &bin | %!xxd
    au bufwritepost *.bin set nomod | endif
augroup end


" disable spell checking for Haskell sources
autocmd filetype haskell set nospell

autocmd BufNewFile,BufRead *.asciidoc set filetype=asciidoc
autocmd BufNewFile,BufRead *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *.d set filetype=dtrace

autocmd BufNewFile,BufRead *.pbxproj set nospell filetype=javascript

"augroup filetypedetect
    "au BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
"augroup END

" evaluate selected expression (make sure it doesn't have \n at the end)
" http://habrahabr.ru/post/180027/#comment_6252913
vnoremap <leader>ex c<C-r>=<C-r>"<cr>


" make changed text in vimdiff easier to read
hi DiffText ctermbg=DarkBlue

autocmd BufRead *.asciidoc map <F4> :exe ':silent make -s'<CR>:redr!<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


function! UpdateMarkdownHeaderLine()
    norm yyp
    s/[^|]/-/g
    noh
    let pos = getcurpos()
    let pos[1] += 1
    call setpos('.', pos)
    d
endfunction

"let g:syntastic_objcpp_include_dirs = ['/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk']
"let g:syntastic_objcpp_compiler_options = '-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk'

""" URLs:
" http://www.derekwyatt.org/vim/the-vimrc-file/the-absolute-bare-minimum
" http://sovety.blogspot.com/2009/05/highlight-trailing-whitespace-and-tabs.html
" http://vim.wikia.com/wiki/C%2B%2B_code_completion
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" vim: textwidth=0
