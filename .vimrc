" This is all for COC aka intellisense, copy/pasted directly from the README
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate 
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Everything above this line is for COC, scroll to top of file to see notes

set scrolloff=20
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set foldmethod=indent
set foldenable
set splitright "Opens new vertical split files to the left
set mouse=a "Allows mouse to be used in Vim
set incsearch "When you search (for example, using /), the matches will be shown while you type.
set termguicolors "Adds deep colors not available on mac terminal.
set guifont=Monospace\ Krypton\ 12

autocmd VimResized * wincmd = "Auto resizes splits when resizing Vim window
"Plug-ins**************************************************************
call plug#begin('~/.vim/plugged')
  "File explorer
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  "Theme
  Plug 'ayu-theme/ayu-vim'
  " Syntax
  Plug 'pangloss/vim-javascript'
  "Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"Plug-ins**************************************************************

let ayucolor="dark"
colorscheme ayu

"Override colorscheme colors for certain elements
highlight LineNr guifg=#606060
highlight jsDocParam guifg=#9F4A20
highlight jsDocTypeBrackets guifg=#226688
highlight jsDocTypeNoParam guifg=#226688
highlight jsDocType guifg=#226688
highlight jsDocTags guifg=#907248
highlight NetrwDir guifg=#5c6773

let g:javascript_plugin_jsdoc = 1
let &t_SI = "\<Esc>[3 q" "Changes cursor to blinking line during insert mode.
let &t_EI = "\<Esc>[2 q" "Changes cursor to solid block during normal mode.
let mapleader = " "
nnoremap <leader>f :Files<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>q :q<CR>
nnoremap <leader>= <C-w>20>
nnoremap <leader>- <C-w>20<
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>v :vs<CR>
nnoremap <leader>vv <C-v>
"Comment out an entire line
nnoremap // 0i//<ESC>
"Move half a page up and keep cursor centered
nnoremap <leader>j <C-d> M
"Move half a page down and keep cursor centered
nnoremap <leader>k <C-u> M
nnoremap <leader>s :%s/
nnoremap <leader>r :Run<CR>
" Goto tab prev and next
nnoremap gl gt
nnoremap gh gT
" Return to normal mode
inoremap ii <Esc>
"
inoremap ` ``<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap log console.log()<Esc>ha
inoremap async async ()<Esc>ha
inoremap tryc try {} catch (e) {<CR><CR>}<ESC>kkf{a<CR><CR><ESC>k0i<TAB><TAB><TAB>
" make yank automatically copy to clipboard to os clipboard
vnoremap <leader>y "+y
"When in visual mode, goto block mode and comment out all lines
vnoremap <silent> / <C-v>^I//<Esc>
" Make shift G go to bottom and end of line
xnoremap G G$

command! Run call RunScriptWithArgs()
function! RunScriptWithArgs()
    " Ensure the buffer has a filename and is saved
    if expand('%') == ''
        echo "Buffer has no file name. Please save the file first."
        return
    endif
    " Check if the file needs to be saved
    if &modified
        if confirm("File has unsaved changes. Save now?", "&Yes\n&No", 1) == 1
            write
        else
            return
        endif
    endif
    " Prompt for arguments
    let l:args = input('Enter arguments: ')
    " Prepare the command
    let l:cmd = 'bash ' . shellescape(expand('%:p')) . ' ' . l:args
    " Execute the script in a new window
    belowright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile filetype=log
    execute '.!' . l:cmd
endfunction

" Complete HTML tags
" Insert mode mapping: Trigger tag auto-completion after typing '>'.
inoremap > <C-R>=CompleteTag()<CR>

" Function to complete the tag with </tag> and place the cursor between ><.
function! CompleteTag()
  " Get the current line content up to the cursor position.
  let line = getline('.')[:col('.')-2]
  
  " Find the last opening tag.
  let tag = matchstr(line, '<\zs\w\+\ze[^<>]*$')
  
  " If no valid tag is found, just insert '>'.
  if empty(tag)
    return '>'
  endif

  " Check if it's a self-closing tag
  let self_closing_tags = ['area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'link', 'meta', 'param', 'source', 'track', 'wbr']
  if index(self_closing_tags, tag) >= 0
    return '>'
  endif

  " Calculate the number of characters to move back
  let move_back = len(tag) + 3  " +3 for '</' and '>'

  " Return the completed closing tag with cursor between ><
  return '></' . tag . '>' . repeat("\<Left>", move_back)
endfunction
