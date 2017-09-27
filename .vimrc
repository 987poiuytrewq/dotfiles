let has_ycm = v:version >= 703 || (v:version == 703 && has('patch598'))
let has_breakindent = v:version > 704 || (v:version == 704 && has('patch338'))
let has_textchanged = v:version > 704 || (v:version == 704 && has('patch126'))

call plug#begin('~/.vim/plugged')

"util
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-titlecase'

Plug 'takac/vim-spotifysearch'

"motion
Plug 'bkad/CamelCaseMotion'
Plug 'terryma/vim-smooth-scroll'
Plug 'vimtaku/hl_matchit.vim'

"insert
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'
Plug 'alvan/vim-closetag'
Plug 'vim-scripts/loremipsum'

"buffers
Plug 'tpope/vim-eunuch'
Plug 'moll/vim-bbye'
Plug 'ntpeters/vim-better-whitespace'

"interface
Plug 'w0rp/ale'
if has_ycm
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
endif
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

"denite
Plug 'Shougo/denite.nvim'

"git
Plug 'neoclide/denite-git'
Plug 'neoclide/easy-git'
Plug 'airblade/vim-gitgutter'

"textobj
Plug 'kana/vim-textobj-user'
Plug 'beloglazov/vim-textobj-quotes'
Plug 'sgur/vim-textobj-parameter'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby,eruby' }
Plug 'bps/vim-textobj-python', {'for': 'python'}

"ruby
Plug 'tpope/vim-rails', { 'for': 'ruby,eruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby,eruby' }

Plug 'fs111/pydoc.vim', { 'for': 'python' }

"file types
Plug 'Quramy/vim-js-pretty-template'
Plug 'hashivim/vim-terraform'
Plug 'kh3phr3n/python-syntax'
Plug 'jamessan/vim-gnupg'
Plug 'lepture/vim-jinja'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mitsuhiko/vim-rst'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot'

"test
Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby,eruby' }

"colors
Plug 'daviesjamie/vim-base16-lightline'
Plug 'chrisbra/Colorizer'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'

call plug#end()

"general
set number
set mouse=a
set ttyfast
set ttimeoutlen=0

"clipboard
set clipboard=unnamed,unnamedplus

"leader
let mapleader = "\<Space>"

"motion overrides
noremap H ^
noremap L $

"camelcasemotion
call camelcasemotion#CreateMotionMappings(',')
set selection=exclusive

"colors
if has('nvim')
    set termguicolors
endif
let g:colorscheme_switcher_exclude_builtins = 1
set t_Co=256
set background=dark
source ~/.vim/base16-circus.vim
augroup colors
    autocmd!
    autocmd ColorScheme,VimEnter * highlight! Normal ctermbg=none guibg=none
    autocmd ColorScheme,VimEnter * highlight! NonText ctermbg=none guibg=none
    autocmd ColorScheme,VimEnter * highlight! EndOfBuffer cterm=none ctermfg=234 ctermbg=234 gui=none guifg=#101010 guibg=#101010
    autocmd ColorScheme,VimEnter * highlight! DiffAdd guifg=none guibg=#002000
    autocmd ColorScheme,VimEnter * highlight! DiffChange guifg=none guibg=none
    autocmd ColorScheme,VimEnter * highlight! DiffText guifg=none guibg=#000020
    autocmd ColorScheme,VimEnter * highlight! DiffDelete guifg=none guibg=#200000
    autocmd FileType javascript,javascript.jsx JsPreTmpl sass
augroup END
set hlsearch
set fillchars=vert:\ ,fold:\ ,diff:\ ,
let python_highlight_all = 1
let g:vim_markdown_frontmatter = 1

"close-tag
let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.jinja,*.jsx,*.js,*.jinja2"

"delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_nesting_quotes =['"',"'"]

"hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'MatchParen'
let g:hl_matchit_cursor_wait = 0.050
let g:hl_matchit_hl_priority = 1

"hl_fold
let g:hl_fold_enabled = 0
let g:hl_fold_start_text = ''
let g:hl_fold_mid_text = ''
let g:hl_fold_end_text = ''
let g:hl_fold_start_linehl = 'MatchParen'
let g:hl_fold_end_linehl = 'MatchParen'

set nobackup
set nowritebackup
set noswapfile
augroup autosave
    autocmd!
    autocmd InsertLeave * nested update

    if has_textchanged
        autocmd TextChanged * nested update
    endif
augroup END

"indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set copyindent
set wrap
autocmd! Filetype python setlocal textwidth=79
autocmd! Filetype javascript setlocal textwidth=99
set formatoptions=crqj

"fold
highlight! Folded ctermfg=none ctermbg=235
set foldmethod=syntax
set foldenable
set foldlevelstart=99
function! FoldText()
    return substitute(getline(v:foldstart), '^.', '▶', '') . ' ... ' .
                \ substitute(getline(v:foldend), '^\s*', '', '')
endfunction
set foldtext=FoldText()

"wrap
if has_breakindent
    set breakindent
endif
set linebreak
" don't break on sigils
set breakat-=:
set breakat-=@
set breakat-=$
set breakat-=&
set showbreak=└─

"whitespace
set listchars=tab:━━,nbsp:·

"buffer navigation
set hidden
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>k :call smooth_scroll#up(&scroll, 10, 5)<CR>
nnoremap <leader>j :call smooth_scroll#down(&scroll, 10, 5)<CR>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>n :nohlsearch<CR>

"window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set splitright
set splitbelow
"close preview window
nnoremap <C-c> :cp<CR>
"paste in insert mode
inoremap <C-p> <C-r>"

"git gutter
set signcolumn=yes
let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_removed            = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
nmap <leader>cu <Plug>GitGutterUndoHunk
nmap <leader>cs <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>GitGutterUndoHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk

"ale
" let g:ale_fix_on_save = 1
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ }
let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint'],
            \ 'python': 'yapf',
            \ }
let g:ale_sign_error = '▶▶'
let g:ale_sign_warning = '▶▶'
highlight! link ALEErrorSign GitGutterDelete
highlight! link ALEWarningSign GitGutterChange
augroup format
    autocmd!
    autocmd BufLeave,BufUnload,BufHidden,WinLeave,FocusLost * silent! ALEFix
augroup END

"lightline
set noshowmode
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'base16',
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'fugitive'],
            \     [ 'readonly', 'filename' ],
            \   ],
            \  'right': [],
            \ },
            \ 'inactive': {
            \   'left': [
            \     [],
            \     [],
            \     [ 'readonly', 'filename' ],
            \   ],
            \  'right': [],
            \ },
            \ 'component_function': {
            \   'readonly': 'LightlineReadonly',
            \   'filename': 'LightlineFilename',
            \   'fugitive': 'LightlineFugitive',
            \ },
            \ }
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFilename()
    return @%
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return 'not git'
endfunction

"buftabline
highlight! link BufTabLineActive TabLineSel
highlight! link BufTabLineCurrent PmenuSel

"unite
" let g:unite_source_history_yank_enable = 1
" call unite#filters#matcher_default#use('matcher_fuzzy')
" call unite#filters#sorter_default#use('sorter_selecta')
" call unite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])
" call unite#custom#source('file', 'converters', ['converter_tail_abbr'])
" call unite#custom#source('file', 'matchers', ['matcher_default'])
" call unite#custom#source('file_rec,file_rec/git', 'converters', ['converter_relative_abbr'])
" nnoremap <leader># :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
" nnoremap <leader>` :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
" nnoremap <leader>d :<C-u>UniteWithBufferDir -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
" nnoremap <leader>f :<C-u>Unite -no-split -smartcase -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
" nnoremap <leader>r :<C-u>Unite -no-split -smartcase -buffer-name=recent -start-insert file_mru<CR>
" nnoremap <leader>o :<C-u>Unite -no-split -smartcase -start-insert -buffer-name=outline outline<CR>
" nnoremap <leader>y :<C-u>Unite -no-split -smartcase -buffer-name=yank history/yank<CR>
" nnoremap <leader>b :<C-u>Unite -no-split -smartcase -buffer-name=buffers buffer<CR>
" nnoremap <leader>cc :<C-u>Unite -no-split -smartcase -buffer-name=quickfix quickfix<CR>
" nnoremap <leader>cl :<C-u>Unite -no-split -smartcase -buffer-name=locations location_list<CR>
" nnoremap <leader>gg :<C-u>Unite -no-split -smartcase -buffer-name=grep grep/git<CR>
" nnoremap <leader>gp :<C-u>UniteResume grep<CR>
" nnoremap <leader>gs :<C-u>Unite -no-split -smartcase -buffer-name=git_status ungite/status<CR>
" nnoremap <leader>gb :<C-u>Unite -no-split -smartcase -buffer-name=git_branch ungite/branch<CR>
"
" "unite customisation
" function! s:unite_directory_keybindings()
"     imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
" endfunction
" autocmd! FileType unite call s:unite_directory_keybindings()
" autocmd! FileType unite setlocal number

"denite
nnoremap <leader>f :<C-u>Denite -split=no -smartcase -buffer-name=files file_rec<CR>
nnoremap <leader>b :<C-u>Denite -split=no -smartcase -buffer-name=buffers buffer<CR>
nnoremap <leader>s :<C-u>Denite -split=no -smartcase -buffer-name=search grep<CR>
call denite#custom#option('default', {
      \ 'prompt': '❯'
      \ })
call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>', 'noremap')
call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

"vimfiler
" nnoremap <leader>s :<C-u>VimFilerBufferDir<CR>
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_expand_jump_to_first_child = 0
" let g:vimfiler_tree_leaf_icon = ''
" let g:vimfiler_tree_opened_icon = '▼'
" let g:vimfiler_tree_closed_icon = '▶'
" let g:vimfiler_tree_readonly_icon = ''
" call vimfiler#custom#profile('default', 'context', {
"         \   'safe_mode' : 0
"         \ })
" autocmd! FileType vimfiler nmap <buffer> <2-LeftMouse> <Plug>(vimfiler_cd_or_edit)
" autocmd! FileType vimfiler nmap <buffer> <LeftMouse> <LeftMouse><Plug>(vimfiler_expand_or_edit)

if has_ycm
    "youcompleteme
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_semantic_triggers = {
                \ 'css': ['re!^\s{2}', 're!:\s+'],
                \ 'scss': ['re!^\s{2}', 're!:\s+'], 
                \ }
    set completeopt-=preview
endif

"ruby complete
let g:rubycomplete_rails = 1
" let g:rubycomplete_buffer_loading = 1 "this causes massive slowdown
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

"rspec
command! Rspec :call RunNearestSpec()<CR>
command! RspecLast :call RunLastSpec()<CR>
command! RspecFile :call RunCurrentSpecFile()<CR>

"javascript-libraries
let g:used_javascript_libs = 'underscore,jquery,react,angularjs'

"python
let g:polyglot_disabled = ['python']
let g:python_highlight_all = 1


"macros
command! HashTorpedo :%s/ ["':]\(\S*\)["']* => / \1: /g

"neovim
if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

if has('nvim')
    let g:terminal_scrollback_buffer_size = 100000
    let g:neoterm_position = 'vertical'
    let test#strategy = 'neoterm'
endif
nnoremap <leader>t :TestNearest<CR>
command! Test :TestNearest()<CR>
let test#python#pytest#options = {
            \ 'nearest': '-svv --pdb',
            \ 'file': '-svv --pdb',
            \ 'suite': '-xsvv --pdb',
            \ }

set exrc
set secure
