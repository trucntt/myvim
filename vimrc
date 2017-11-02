source ~/.vim/plug.vim
"defaults write NSGlobalDomain KeyRepeat -int 1
"defaults write NSGlobalDomain InitialKeyRepeat -int 10

let theme = 'dracula'

if theme == 'dracula'
  color dracula
elseif theme == 'onedark'
  colorscheme onedark
elseif theme == 'smyck'
  colorscheme smyck
elseif theme == 'solarized'
  " terminal color theme setting must be solarized too
  set background=dark
  colorscheme solarized
elseif theme == 'gruvbox'
  let g:gruvbox_contrast_dark='dark'
  colorscheme gruvbox
elseif theme == 'railscasts'
  colorscheme railscasts
elseif theme == 'spacedark'
  colorscheme space-vim-dark
endif

" vim config
syntax on
if has("termguicolors")
  set termguicolors
end
set lazyredraw
set cursorline
set number
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hidden
set history=100
set hlsearch
set showmatch
set autoread
set noswapfile
set nocompatible
set incsearch
set formatoptions+=j
set scrolloff=1
set laststatus=2
set mouse=a
set clipboard^=unnamed,unnamedplus
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/node_modules
set noeb vb t_vb=
filetype on
filetype indent on
filetype plugin indent on

let mapleader=" "
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <tab> %
vnoremap <tab> %
nnoremap S "_diwP
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>vs :source ~/.vimrc<CR>
nnoremap <leader><leader> :e#<CR>

" remove whitespaces on saving
autocmd BufWritePre * :%s/\s\+$//e
" highlight only active buffer
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
au FocusLost * :wa

let g:airline_section_y = []

" pluginconfig
" ==========================================
" easymotion
" ==========================================
map <leader>m <Plug>(easymotion-prefix)

" pluginconfig
" ==========================================
" qfenter
" ==========================================
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['o', '<CR>']
let g:qfenter_keymap.vopen = ['v']
let g:qfenter_keymap.hopen = ['h']
let g:qfenter_keymap.topen = ['t']

" pluginconfig
" ==========================================
" nerdtree
" ==========================================
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>tr :NERDTreeFind<CR>

" pluginconfig
" ==========================================
" YankRing.vim
" ==========================================
nnoremap <leader>ys :YRShow<CR>

" pluginconfig
" ==========================================
" fzf.vim
" ==========================================
let g:fzf_files_options = '--bind alt-a:select-all,alt-d:deselect-all'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <Leader>fa :Files<CR>
nnoremap <Leader>fg :GFiles<CR>
nnoremap <Leader>fe :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fl :BLines<CR>

" pluginconfig
" ==========================================
" text search ack.vim + the_silver_search
" ==========================================
let g:ack_use_cword_for_empty_search = 1
let g:ackhighlight = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0
nnoremap <Leader>sb :Ack!<Space>''<Left>
nnoremap <Leader>sq :Ack!<CR>
nnoremap <Leader>sl :LAck!<CR>
vnoremap <Leader>sq y:Ack! '<C-r>=fnameescape(@")<CR>'<CR>
vnoremap <Leader>sl y:LAck! '<C-r>=fnameescape(@")<CR>'<CR>
nnoremap <leader>sc :nohlsearch<CR>

" pluginconfig
" ==========================================
" vim-jsx
" ==========================================
let g:jsx_ext_required = 0

" pluginconfig
" ==========================================
" git-fugitive
" ==========================================
if exists(":GdiffT") == 0
  command GdiffT tabedit %|Gdiff
endif
if exists(":GstatusT") == 0
  command GstatusT tabedit %|Gstatus
endif
nnoremap <leader>gs :GstatusT<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gb :Gblame<CR>


" pluginconfig
" ==========================================
" NERDTree
" ==========================================
let g:NERDTreeIgnore=['node_modules', '\.git$', '\~$']

" pluginconfig
" ==========================================
" ctrl.p
" ==========================================
let g:ctrlp_regexp = 1
" let g:ctrlp_custom_ignore = '\v[\/](build|more-dir-here|save-quit-f5)$'

" pluginconfig
" ==========================================
" MatchTagAlways
" ==========================================
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'javascript.jsx' : 1 }

" pluginconfig
" ==========================================
" syntastic
" ==========================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" javascript lint
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
" eslint require following libs to work and .eslintrc files
" npm install --save-dev eslint eslint-config-airbnb babel-eslint eslint-plugin-react eslint-plugin-import eslint-plugin-jsx-a11y
" http://remarkablemark.org/blog/2016/09/28/vim-syntastic-eslint/

" pluginconfig
" ==========================================
" startify
" ==========================================
let g:startify_skiplist = [
            \ '.git/index',
            \ '.git/config',
            \ ]
let g:startify_bookmarks = [
            \ { 'v': '~/.vim/vimrc' },
            \ ]
let g:startify_list_order = [
            \ ['   Bookmarks'],
            \ 'bookmarks',
            \ ['   MRU'],
            \ 'files',
            \ ['   Sessions'],
            \ 'sessions',
            \ ]
let g:startify_enable_special     = 1
let g:startify_change_to_dir      = 0
let g:startify_change_to_vcs_root = 1
let g:startify_relative_path      = 1
let g:startify_update_oldfiles    = 1
let g:startify_custom_header      = []
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_disable_at_vimenter= 0
let g:startify_session_before_save = ['silent! NERDTreeClose']

" pluginconfig
" ==========================================
" neocomplete
" ==========================================
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
