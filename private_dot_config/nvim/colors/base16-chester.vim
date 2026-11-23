" Base16-style Neovim/Vim colorscheme derived from Ghostty's Chester palette.
" Base00-07 are editor neutrals; Base08-0F are semantic accent colors.
set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'base16-chester'

let g:base16_gui00 = '2c3643'
let g:base16_gui01 = '35414e'
let g:base16_gui02 = '475663'
let g:base16_gui03 = '6f6b68'
let g:base16_gui04 = 'b4b1b1'
let g:base16_gui05 = 'ffffff'
let g:base16_gui06 = 'f3f3f3'
let g:base16_gui07 = 'ffffff'
let g:base16_gui08 = 'fa5e5b'
let g:base16_gui09 = 'f28d4e'
let g:base16_gui0A = 'ffc83f'
let g:base16_gui0B = '16c98d'
let g:base16_gui0C = '28ddde'
let g:base16_gui0D = '288ad6'
let g:base16_gui0E = 'd34590'
let g:base16_gui0F = 'b46f58'

" cterm fallbacks use Chester's ANSI slots; truecolor gives the full Base16 palette.
let g:base16_cterm00 = '0'
let g:base16_cterm01 = '0'
let g:base16_cterm02 = '8'
let g:base16_cterm03 = '8'
let g:base16_cterm04 = '7'
let g:base16_cterm05 = '7'
let g:base16_cterm06 = '15'
let g:base16_cterm07 = '15'
let g:base16_cterm08 = '1'
let g:base16_cterm09 = '9'
let g:base16_cterm0A = '3'
let g:base16_cterm0B = '2'
let g:base16_cterm0C = '6'
let g:base16_cterm0D = '4'
let g:base16_cterm0E = '5'
let g:base16_cterm0F = '1'

if has('nvim')
  let g:terminal_color_0 = '#080200'
  let g:terminal_color_1 = '#fa5e5b'
  let g:terminal_color_2 = '#16c98d'
  let g:terminal_color_3 = '#ffc83f'
  let g:terminal_color_4 = '#288ad6'
  let g:terminal_color_5 = '#d34590'
  let g:terminal_color_6 = '#28ddde'
  let g:terminal_color_7 = '#e7e7e7'
  let g:terminal_color_8 = '#6f6b68'
  let g:terminal_color_9 = '#fa5e5b'
  let g:terminal_color_10 = '#16c98d'
  let g:terminal_color_11 = '#feef6d'
  let g:terminal_color_12 = '#278ad6'
  let g:terminal_color_13 = '#d34590'
  let g:terminal_color_14 = '#27dede'
  let g:terminal_color_15 = '#ffffff'
  let g:terminal_color_background = '#2c3643'
  let g:terminal_color_foreground = '#ffffff'
endif

highlight Normal       guifg=#ffffff guibg=#2c3643 ctermfg=15 ctermbg=NONE
highlight NormalFloat  guifg=#ffffff guibg=#35414e ctermfg=15 ctermbg=0
highlight NormalNC     guifg=#ffffff guibg=#2c3643 ctermfg=15 ctermbg=NONE
highlight EndOfBuffer  guifg=#2c3643 guibg=#2c3643 ctermfg=0 ctermbg=NONE
highlight Comment     guifg=#b4b1b1 ctermfg=7 gui=italic cterm=italic
highlight Constant    guifg=#f28d4e ctermfg=9
highlight String      guifg=#16c98d ctermfg=2
highlight Character   guifg=#16c98d ctermfg=2
highlight Number      guifg=#f28d4e ctermfg=9
highlight Boolean     guifg=#f28d4e ctermfg=9
highlight Float       guifg=#f28d4e ctermfg=9
highlight Identifier  guifg=#fa5e5b ctermfg=1
highlight Function    guifg=#288ad6 ctermfg=4
highlight Statement   guifg=#d34590 ctermfg=5
highlight Conditional guifg=#d34590 ctermfg=5
highlight Repeat      guifg=#d34590 ctermfg=5
highlight Operator    guifg=#e7e7e7 ctermfg=7
highlight PreProc     guifg=#ffc83f ctermfg=3
highlight Type        guifg=#ffc83f ctermfg=3
highlight Special     guifg=#28ddde ctermfg=6
highlight Delimiter   guifg=#b46f58 ctermfg=1
highlight Underlined  guifg=#288ad6 ctermfg=4 gui=underline cterm=underline
highlight Todo        guifg=#2c3643 guibg=#ffc83f ctermfg=0 ctermbg=3 gui=bold cterm=bold
highlight Error       guifg=#ffffff guibg=#fa5e5b ctermfg=15 ctermbg=1 gui=bold cterm=bold
highlight WarningMsg  guifg=#ffc83f ctermfg=3
highlight ErrorMsg    guifg=#fa5e5b ctermfg=1
highlight Search      guifg=#2c3643 guibg=#ffc83f ctermfg=0 ctermbg=3
highlight IncSearch   guifg=#2c3643 guibg=#fa5e5b ctermfg=0 ctermbg=1
highlight Substitute guifg=#2c3643 guibg=#ffc83f ctermfg=0 ctermbg=3
highlight Visual      guibg=#475663 ctermbg=8
highlight MatchParen  guifg=#28ddde guibg=#35414e ctermfg=6 ctermbg=0 gui=bold cterm=bold
highlight LineNr      guifg=#6f6b68 guibg=#2c3643 ctermfg=8 ctermbg=NONE
highlight CursorLine  guibg=#35414e ctermbg=0
highlight CursorLineNr guifg=#ffc83f guibg=#35414e ctermfg=3 ctermbg=0 gui=bold cterm=bold
highlight SignColumn  guifg=#6f6b68 guibg=#2c3643 ctermfg=8 ctermbg=NONE
highlight ColorColumn guibg=#35414e ctermbg=0
highlight VertSplit   guifg=#475663 guibg=#2c3643 ctermfg=8 ctermbg=NONE
highlight StatusLine  guifg=#ffffff guibg=#475663 ctermfg=15 ctermbg=8
highlight StatusLineNC guifg=#b4b1b1 guibg=#35414e ctermfg=7 ctermbg=0
highlight TabLine     guifg=#b4b1b1 guibg=#35414e ctermfg=7 ctermbg=0
highlight TabLineSel  guifg=#2c3643 guibg=#16c98d ctermfg=0 ctermbg=2 gui=bold cterm=bold
highlight TabLineFill guifg=#6f6b68 guibg=#2c3643 ctermfg=8 ctermbg=NONE
highlight Pmenu       guifg=#e7e7e7 guibg=#35414e ctermfg=7 ctermbg=0
highlight PmenuSel    guifg=#2c3643 guibg=#28ddde ctermfg=0 ctermbg=6
highlight PmenuSbar   guibg=#475663 ctermbg=8
highlight PmenuThumb  guibg=#b4b1b1 ctermbg=7
highlight Folded      guifg=#b4b1b1 guibg=#35414e ctermfg=7 ctermbg=0
highlight FoldColumn  guifg=#28ddde guibg=#2c3643 ctermfg=6 ctermbg=NONE
highlight NonText     guifg=#6f6b68 ctermfg=8
highlight SpecialKey  guifg=#6f6b68 ctermfg=8
highlight Directory   guifg=#288ad6 ctermfg=4
highlight Title       guifg=#288ad6 ctermfg=4 gui=bold cterm=bold
highlight Question    guifg=#16c98d ctermfg=2
highlight DiffAdd     guifg=#16c98d guibg=#35414e ctermfg=2 ctermbg=0
highlight DiffChange  guifg=#288ad6 guibg=#35414e ctermfg=4 ctermbg=0
highlight DiffDelete  guifg=#fa5e5b guibg=#35414e ctermfg=1 ctermbg=0
highlight DiffText    guifg=#ffc83f guibg=#475663 ctermfg=3 ctermbg=8 gui=bold cterm=bold
highlight SpellBad    guisp=#fa5e5b gui=undercurl
highlight SpellCap    guisp=#288ad6 gui=undercurl
highlight SpellLocal  guisp=#28ddde gui=undercurl
highlight SpellRare   guisp=#d34590 gui=undercurl

highlight DiagnosticError guifg=#fa5e5b ctermfg=1
highlight DiagnosticWarn  guifg=#ffc83f ctermfg=3
highlight DiagnosticInfo  guifg=#288ad6 ctermfg=4
highlight DiagnosticHint  guifg=#28ddde ctermfg=6
highlight DiagnosticUnderlineError guisp=#fa5e5b gui=undercurl
highlight DiagnosticUnderlineWarn  guisp=#ffc83f gui=undercurl
highlight DiagnosticUnderlineInfo  guisp=#288ad6 gui=undercurl
highlight DiagnosticUnderlineHint  guisp=#28ddde gui=undercurl

highlight link htmlTag               Identifier
highlight link htmlEndTag            Identifier
highlight link markdownCode          String
highlight link markdownCodeBlock     String
highlight link gitcommitComment      Comment
highlight link gitcommitSummary      String
highlight link GitGutterAdd           DiffAdd
highlight link GitGutterChange       DiffChange
highlight link GitGutterDelete       DiffDelete

if has('nvim')
  highlight link @function Function
  highlight link @function.call Function
  highlight link @keyword Statement
  highlight link @keyword.return Statement
  highlight link @string String
  highlight link @type Type
  highlight link @variable Identifier
  highlight link @comment Comment
  highlight link @constant Constant
  highlight link @number Number
  highlight link @operator Operator
end
