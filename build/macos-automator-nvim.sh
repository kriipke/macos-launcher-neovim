# IMPORTANT: This script is inserted into part of a macOS Automator application launcher. For that reason, there is no shebang line at the top. However, this script will not run properly unless it is run with bash (not sh), due to the process substitution used in the last line. Make sure you set the configurator in the macOS Automator application to use '/bin/bash' from the "Shell" dropdown above the text.

read -r -d '' NVIM_CONFIG <<'EOF'
"let g:deoplete#enable_at_startup = 1
let g:tagbar_ctags_bin=expand('/opt/homebrew/bin/ctags')
call plug#begin()
Plug 'dracula/vim', { 'commit': '147f389f4275cec4ef43ebc25e2011c57b45cc00' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-journal'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'rhysd/vim-color-spring-night'
Plug 'fladson/vim-kitty'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'vim-scripts/loremipsum'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'voldikss/vim-floaterm'
Plug 'joenye/coc-cfn-lint'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')
syntax on
color dracula
set termguicolors
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=utf-8
set number
set title
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
map <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
nmap <silent> <C-e> <Plug>(ale_next_wrap)
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
let g:SuperTabDefaultCompletionType = "<C-n>"
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction
function! ColorDracula()
    let g:airline_theme=''
    color dracula
    IndentLinesEnable
endfunction
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
    IndentLinesDisable
endfunction
function! ColorForgotten()
    " Light airline themes: tomorrow, silver, alduin
    " Light colors: forgotten-light, nemo-light
    let g:airline_theme='tomorrow'
    color forgotten-light
    IndentLinesDisable
endfunction
function! ColorZazen()
    let g:airline_theme='ayu_dark'
    color zazen
    IndentLinesEnable
endfunction
function! ColorXtal()
    let g:airline_theme='badwolf'
    color zazen
    IndentLinesEnable
endfunction
let mapleader=";"
nmap <leader>q :NERDTreeToggle<CR>
nmap <leader>w :TagbarToggle<CR>
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme 
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorSeoul256()<CR>
nmap <leader>e3 :call ColorForgotten()<CR>
nmap <leader>e4 :call ColorZazen()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>
nmap <leader>d <Plug>(pydocstring)
nmap <leader>f :Files<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!/usr/bin/python3 -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
let g:airline_theme='badwolf'
color zazen
EOF

read -r -d '' KITTY_CONFIG <<'EOF'
font_family		Cousine Nerd Font Mono Regular
bold_font		Cousine Nerd Font Mono Bold
italic_font		Cousine Nerd Font Mono Italic
bold_italic_font	Cousine Nerd Font Mono Bold Italic
font_size 10.5
box_drawing_scale 0.001, .3, .5, 1
cursor					#888888
cursor_shape 			block
cursor_text_color 		background
cursor_blink_interval 	-1
cursor_stop_blinking_after 10.0
scrollback_lines 9999
scrollback_pager bat --pager "less --chop-long-lines +INPUT_LINE_NUMBER"
url_style 			curly
open_url_with 		default
url_prefixes file ftp ftps gemini git gopher http https irc ircs kitty nfs mailto news sftp ssh
copy_on_select yes
map shift+cmd+v paste_from_buffer a1
strip_trailing_spaces always
mouse_map ctrl+shift+right press ungrabbed mouse_show_command_output
remember_window_size  no
initial_window_width  600
initial_window_height 1000
window_margin_width 2
single_window_margin_width  5
window_padding_width 14
hide_window_decorations yes
window_border_width 1
window_margin_width 2.0
single_window_margin_width 10
window_padding_width 3.0
active_border_color #444444
inactive_border_color #222222
inactive_text_alpha 0.75
tab_bar_style powerline
foreground					#c4c4b5
selection_foreground		#000000
background_opacity			0.75
dynamic_background_opacity 	yes
dim_opacity					0.65
color0 #191919
color8 #615e4b
color1 #f3005f
color9 #f3005f
color2 #97e023
color10 #97e023
color3 #fa8419
color11 #dfd561
color4 #b90ca7
color12 #b90ca7
color5 #f3005f
color13 #f3005f
color6 #57d1ea
color14 #57d1ea
color7 #c4c4b5
color15 #f6f6ee
shell /usr/bin/env zsh --login --interactive
editor /opt/homebrew/bin/nvim -u ~/.config/nvim/init.vim
allow_remote_control socket-only
listen_on none
shell_integration enabled
clone_source_strategies venv,conda,env_var,path
term xterm-kitty
macos_hide_from_tasks no
macos_menubar_title_max_length 25
map kitty_mod+c clear_terminal scroll active
map kitty_mod+e combine : new_window : next_layout
kitty_mod ctrl+shift
map f1 launch --stdin-source=@screen_scrollback --stdin-add-formatting --type=overlay less +G -R
map kitty_mod+g show_last_command_output
map kitty_mod+escape kitty_shell window 
map kitty_mod+escape kitty_shell window 
map kitty_mod+f2 edit_config_file
map kitty_mod+f5 load_config /path/to/alternative/kitty.conf
map kitty_mod+f1 launch --stdin-source=@screen_scrollback --stdin-add-formatting less +G -R
EOF

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

if [ -r /opt/homebrew/bin ]; then
	PATH="/opt/homebrew/bin:$PATH"
fi


if [ -r /opt/homebrew/manpages ]; then
	MANPATH="/opt/homebrew/manpages:$MANPATH"
fi

export MANPATH PATH

echo "$NVIM_CONFIG" > /tmp/neovim-kitty-launcher.conf
/Applications/kitty.app/Contents/MacOS/kitty -c <(cat "$KITTY_CONFIG") /bin/zsh -c nvim -u /tmp/neovim-kitty-launcher.conf; exit;

#/Applications/kitty.app/Contents/MacOS/kitty -c <(echo "$KITTY_CONFIG") nvim -u /tmp/neovim-kitty-launcher.conf
