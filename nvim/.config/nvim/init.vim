call plug#begin('~/.vim/plugged')
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 调试
Plug 'puremourning/vimspector'
" 文件浏览器
Plug 'preservim/nerdtree'
" Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" 菜单
Plug 'skywind3000/vim-quickui'
" 模糊搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 注释
Plug 'scrooloose/nerdcommenter'
" 简单移动
Plug 'easymotion/vim-easymotion'
" 定位根目录
Plug 'airblade/vim-rooter'
" 启动屏幕
Plug 'mhinz/vim-startify'
" 符号自动补全
Plug 'Raimondi/delimitMate'
" 环绕
Plug 'tpope/vim-surround'
" 参数文本对象
Plug 'vim-scripts/argtextobj.vim'
" yank高亮
Plug 'machakann/vim-highlightedyank'
" Kotlin支持
Plug 'udalov/kotlin-vim'
" Typescript支持
Plug 'leafgarland/typescript-vim'
" JSX支持
Plug 'peitalin/vim-jsx-typescript'
" Dart支持
Plug 'dart-lang/dart-vim-plugin'
" 配色方案
Plug 'rakr/vim-one'
call plug#end()


" 按键映射
let mapleader=" "
nnoremap <Leader>f :Format<CR>:OR<CR>:w<CR>
nnoremap <silent> <Leader>T :NERDTreeToggle<CR>
nnoremap <silent> <Leader>M :call quickui#menu#open()<CR>
nnoremap <silent> <Leader>R :Startify<CR>
nmap <silent> <Leader>s <Plug>(coc-range-select)
xmap <silent> <Leader>s <Plug>(coc-range-select)
let g:vimspector_enable_mappings = 'HUMAN'
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" 相对行号
set relativenumber
" 智能TAB
set smarttab
set shiftwidth=4
set tabstop=4
" 智能区分大小写
set smartcase
" TAB字符显示宽度
set tabstop=4
" 输入TAB替换为空格
set expandtab
set scrolloff=10
set sidescrolloff=15
" 光标行列高亮
set cursorline cursorcolumn  

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme one
set background=dark

let g:airline_theme='one'
" 启用标签栏
let g:airline#extensions#tabline#enabled = 1
" 注释自动添加空格
let g:NERDSpaceDelims=1
" 显示隐藏文件
let NERDTreeShowHidden=1


" 自定义命令
" 格式化代码
command! -nargs=0 Format :CocCommand prettier.formatFile
" 
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 整理导入语句
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Coc插件
let g:coc_global_extensions = [
                        \'coc-todolist',
                        \'coc-git',
                        \'coc-snippets',
                        \'coc-prettier',
                        \'coc-eslint',
                        \'coc-tsserver',
                        \'coc-flutter',
                        \'coc-vetur',
                        \'coc-graphql',
                        \'coc-json',
                        \'coc-html',
                        \'coc-css',
                        \'coc-yaml',
                        \'coc-java',
                        \'coc-sql',
                        \'coc-xml'
                        \]

" 调试支持
let g:vimspector_install_gadgets = ['vscode-node-debug2']


call quickui#menu#install('文件', [
            \ [ "聚焦", 'NERDTreeFind' ],
            \ [ "--", '' ],
            \ [ "保存全部", 'wa' ],
            \ [ "退出", 'qa' ],
            \ ])
call quickui#menu#install('缓冲区', [
    \ ["缓冲区列表", "Buffers"],
    \ ["关闭当前缓冲区", "bd"]
  \ ])

call quickui#menu#install('转到', [
            \ [ "转到定义", 'CocAction("jumpDefinition")' ],
            \ ])


" COC配置
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

