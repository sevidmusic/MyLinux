" ===============================================================
" darling1
" A dark color scheme for neovim based on the tender color scheme.
" https://github/com/jacoborus/tender.vim
" URL: https://github.com/sevidmusic/MyLinux/blob/PopOS/.config/nvim/colors/darling1.vim
" Author: Sevi D https://github.com/sevidmusic
" License: MIT
" Last Change: 2023/02/21 15:28
" ===============================================================

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="darling1"

let Italic = ""

if exists('g:darling1_italic')
  let Italic = "italic"
endif

let g:darling1_italic = get(g:, 'darling1_italic', 0)

let Bold = ""

if exists('g:darling1_bold')
  let Bold = "bold"
endif

let g:darling1_bold = get(g:, 'darling1_bold', 0)

" Color Column and Cursor Column
hi ColorColumn ctermfg=NONE ctermbg=8 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=8 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=8 cterm=NONE
hi CursorLineNr ctermfg=81 ctermbg=NONE cterm=NONE

" Colors for directory listings. This effects the colors of NerdTree.
hi Directory ctermfg=153 ctermbg=NONE cterm=NONE

" Diff Colors
" hi DiffAdd ctermfg=NONE ctermbg=238 cterm=NONE
" hi DiffChange ctermfg=NONE ctermbg=239 cterm=NONE
" hi DiffDelete ctermfg=203 ctermbg=237 cterm=NONE
" hi DiffText ctermfg=NONE ctermbg=NONE gui=reverse cterm=reverse
" hi diffAdded ctermfg=185 ctermbg=NONE cterm=NONE
" hi diffChanged ctermfg=153 ctermbg=NONE cterm=NONE
" hi diffRemoved ctermfg=203 ctermbg=NONE cterm=NONE
" hi diffSubname ctermfg=142 ctermbg=NONE cterm=NONE

" Splits
" hi VertSplit ctermfg=235 ctermbg=235 cterm=NONE

" Folds
" hi FoldColumn ctermfg=242 ctermbg=234 cterm=NONE
" hi Folded ctermfg=242 ctermbg=234 cterm=NONE
" hi SignColumn ctermfg=246 ctermbg=235 cterm=NONE

" Vim
" hi vimCommentString ctermfg=58 ctermbg=NONE cterm=NONE
" hi vimCommentTitle ctermfg=66 ctermbg=NONE cterm=NONE

" Search
" hi IncSearch ctermfg=15 ctermbg=0 cterm=Bold,reverse
hi Search ctermfg=157 ctermbg=16 cterm=underline,Bold

" Matching
hi MatchParen ctermfg=202 ctermbg=16 cterm=Bold

" Line Numbers
hi LineNr ctermfg=208 ctermbg=NONE cterm=NONE


" Status Line
hi StatusLine ctermfg=234 ctermbg=242 cterm=Bold
hi StatusLineNC ctermfg=246 ctermbg=238 cterm=NONE


hi Visual ctermfg=NONE ctermbg=237 cterm=Bold
hi VisualNOS ctermfg=NONE ctermbg=237 cterm=Bold

" Code
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE
hi Constant ctermfg=215 ctermbg=NONE cterm=NONE
hi String ctermfg=180 ctermbg=NONE cterm=NONE
hi Character ctermfg=215 ctermbg=NONE cterm=NONE
hi Boolean ctermfg=215 ctermbg=NONE cterm=NONE
hi Number ctermfg=215 ctermbg=NONE cterm=NONE
hi Float ctermfg=215 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=153 ctermbg=NONE cterm=NONE
hi Function ctermfg=153 ctermbg=NONE cterm=NONE
hi Statement ctermfg=201 ctermbg=NONE cterm=NONE
hi Conditional ctermfg=185 ctermbg=NONE cterm=NONE
hi Operator ctermfg=203 ctermbg=NONE cterm=NONE
hi Exception ctermfg=203 ctermbg=NONE cterm=NONE
hi PreProc ctermfg=147 ctermbg=NONE cterm=NONE
hi Type ctermfg=33 ctermbg=NONE cterm=NONE
hi Special ctermfg=81 ctermbg=NONE cterm=NONE
" TODO example
hi Todo ctermfg=16 ctermbg=242 cterm=Bold,underline


" Css
 hi cssVendor ctermfg=142 ctermbg=NONE cterm=NONE
 hi cssVisualVal ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssTagName ctermfg=142 ctermbg=NONE cterm=NONE
 hi cssAttrComma ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssBackgroundProp ctermfg=153 ctermbg=NONE cterm=NONE
 hi cssBorderProp ctermfg=153 ctermbg=NONE cterm=NONE
 hi cssBoxProp ctermfg=81 ctermbg=NONE cterm=NONE
 hi cssDimensionProp ctermfg=81 ctermbg=NONE cterm=NONE
 hi cssFontProp ctermfg=153 ctermbg=NONE cterm=NONE
 hi cssPositioningProp ctermfg=81 ctermbg=NONE cterm=NONE
 hi cssTextProp ctermfg=153 ctermbg=NONE cterm=NONE
 hi cssValueLength ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssValueInteger ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssValueNumber ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssIdentifier ctermfg=142 ctermbg=NONE cterm=NONE
 hi cssIncludeKeyword ctermfg=215 ctermbg=NONE cterm=NONE
 hi cssImportant ctermfg=203 ctermbg=NONE cterm=NONE
 hi cssClassName ctermfg=185 ctermbg=NONE cterm=NONE
 hi cssClassNameDot ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssProp ctermfg=153 ctermbg=NONE cterm=NONE
 hi cssAttr ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssUnitDecorators ctermfg=255 ctermbg=NONE cterm=NONE
 hi cssNoise ctermfg=203 ctermbg=NONE cterm=NONE

" Git
hi gitcommitBranch ctermfg=81 ctermbg=NONE cterm=NONE
hi gitcommitDiscardedType ctermfg=196 ctermbg=NONE cterm=NONE
hi gitcommitSelectedType ctermfg=142 ctermbg=NONE cterm=NONE
hi gitcommitHeader ctermfg=153 ctermbg=NONE cterm=NONE
hi gitcommitUntrackedFile ctermfg=215 ctermbg=NONE cterm=NONE
hi gitcommitDiscardedFile ctermfg=203 ctermbg=NONE cterm=NONE
hi gitcommitSelectedFile ctermfg=185 ctermbg=NONE cterm=NONE
hi GitGutterAdd ctermfg=185 ctermbg=NONE cterm=NONE
hi GitGutterChange ctermfg=153 ctermbg=NONE cterm=NONE
hi GitGutterDelete ctermfg=203 ctermbg=NONE cterm=NONE
hi GitGutterChangeDelete ctermfg=203 ctermbg=NONE cterm=NONE
hi link SignifySignAdd GitGutterAdd
hi link SignifySignDelete GitGutterDelete
hi link SignifySignDeleteFirstLine SignifySignDelete
hi link SignifySignChange GitGutterChange
hi link SignifySignChangeDelete GitGutterChangeDelete

" Help
hi helpHyperTextEntry ctermfg=185 ctermbg=NONE cterm=NONE
hi helpHeadline ctermfg=81 ctermbg=NONE cterm=NONE
hi helpSectionDelim ctermfg=242 ctermbg=NONE cterm=NONE
hi helpNote ctermfg=203 ctermbg=NONE cterm=NONE

" Spell Check
hi SpellBad ctermfg=203 ctermbg=NONE cterm=Bold,underline
hi SpellLocal ctermfg=180 ctermbg=NONE cterm=NONE
hi SpellCap ctermfg=215 ctermbg=NONE cterm=NONE
hi SpellRare ctermfg=81 ctermbg=NONE cterm=NONE

" Text
hi NonText ctermfg=238 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=238 ctermbg=NONE cterm=NONE
hi Title ctermfg=153 ctermbg=NONE cterm=Bold
hi Underlined ctermfg=NONE ctermbg=NONE gui=underline cterm=underline

" Normal font color && background color
hi Normal ctermfg=255 ctermbg=0 cterm=NONE

" Errors and Warnings
hi WarningMsg ctermfg=203 ctermbg=NONE cterm=NONE
hi ErrorMsg ctermfg=203 ctermbg=NONE gui=reverse cterm=reverse
hi vimError ctermfg=255 ctermbg=203 cterm=NONE
hi Error ctermfg=255 ctermbg=203 cterm=NONE
hi markdownError ctermfg=203 ctermbg=NONE cterm=NONE

" Menus
" hi WildMenu ctermfg=235 ctermbg=185 cterm=Bold

" JSON
" hi jsonEscape ctermfg=81 ctermbg=NONE cterm=NONE
" hi jsonNumber ctermfg=215 ctermbg=NONE cterm=NONE
" hi jsonBraces ctermfg=255 ctermbg=NONE cterm=NONE
" hi jsonNull ctermfg=215 ctermbg=NONE cterm=NONE
" hi jsonBoolean ctermfg=215 ctermbg=NONE cterm=NONE
" hi jsonKeywordMatch ctermfg=203 ctermbg=NONE cterm=NONE
" hi jsonQuote ctermfg=255 ctermbg=NONE cterm=NONE
" hi jsonNoise ctermfg=203 ctermbg=NONE cterm=NONE

" Markdown
" hi markdownH1 ctermfg=153 ctermbg=NONE cterm=Bold
" hi markdownHeadingRule ctermfg=203 ctermbg=NONE cterm=Bold
" hi markdownHeadingDelimiter ctermfg=203 ctermbg=NONE cterm=Bold
" hi markdownListMarker ctermfg=215 ctermbg=NONE cterm=NONE
" hi markdownBlockquote ctermfg=215 ctermbg=NONE cterm=NONE
" hi markdownRule ctermfg=185 ctermbg=NONE cterm=NONE
" hi markdownLinkText ctermfg=185 ctermbg=NONE cterm=NONE
" hi markdownLinkTextDelimiter ctermfg=153 ctermbg=NONE cterm=NONE
" hi markdownLinkDelimiter ctermfg=153 ctermbg=NONE cterm=NONE
" hi markdownIdDeclaration ctermfg=142 ctermbg=NONE cterm=NONE
" hi markdownAutomaticLink ctermfg=81 ctermbg=NONE cterm=NONE
" hi markdownUrl ctermfg=81 ctermbg=NONE cterm=NONE
" hi markdownUrlTitle ctermfg=180 ctermbg=NONE cterm=NONE
" hi markdownUrlDelimiter ctermfg=215 ctermbg=NONE cterm=NONE
" hi markdownUrlTitleDelimiter ctermfg=58 ctermbg=NONE cterm=NONE
" hi markdownCodeDelimiter ctermfg=81 ctermbg=NONE cterm=NONE
" hi markdownCode ctermfg=180 ctermbg=NONE cterm=NONE
" hi markdownEscape ctermfg=81 ctermbg=NONE cterm=NONE

" NERDTree
hi NERDTreeHelp ctermfg=255 ctermbg=NONE cterm=NONE
hi NERDTreeHelpKey ctermfg=185 ctermbg=NONE cterm=NONE
hi NERDTreeHelpCommand ctermfg=215 ctermbg=NONE cterm=NONE
hi NERDTreeHelpTitle ctermfg=153 ctermbg=NONE cterm=NONE
hi NERDTreeUp ctermfg=185 ctermbg=NONE cterm=NONE
hi NERDTreeCWD ctermfg=81 ctermbg=NONE cterm=NONE
hi NERDTreeOpenable ctermfg=203 ctermbg=NONE cterm=NONE
hi NERDTreeClosable ctermfg=215 ctermbg=NONE cterm=NONE

" VimPlug
hi plug2 ctermfg=185 ctermbg=NONE cterm=NONE
hi plugH2 ctermfg=81 ctermbg=NONE cterm=Bold
hi plugBracket ctermfg=153 ctermbg=NONE cterm=NONE
hi plugNumber ctermfg=215 ctermbg=NONE cterm=NONE
hi plugDash ctermfg=215 ctermbg=NONE cterm=NONE
hi plugStar ctermfg=180 ctermbg=NONE cterm=NONE
hi plugMessage ctermfg=215 ctermbg=NONE cterm=NONE
hi plugName ctermfg=153 ctermbg=NONE cterm=NONE
hi plugUpdate ctermfg=203 ctermbg=NONE cterm=NONE
hi plugEdge ctermfg=185 ctermbg=NONE cterm=NONE
hi plugSha ctermfg=180 ctermbg=NONE cterm=NONE
hi plugNotLoaded ctermfg=237 ctermbg=NONE cterm=NONE


" XML
hi xmlNamespace ctermfg=215 ctermbg=NONE cterm=NONE
hi xmlAttribPunct ctermfg=203 ctermbg=NONE cterm=NONE
hi xmlProcessingDelim ctermfg=203 ctermbg=NONE cterm=NONE

" Javascript
hi javaScriptBraces ctermfg=153 ctermbg=NONE cterm=NONE
hi javaScriptBrowserObjects ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptDOMObjects ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptDocSeeTag ctermfg=66 ctermbg=NONE cterm=NONE
hi javaScriptDocTags ctermfg=242 ctermbg=NONE cterm=NONE
hi javaScriptFuncArg ctermfg=215 ctermbg=NONE cterm=NONE
hi javaScriptNull ctermfg=215 ctermbg=NONE cterm=NONE
hi javaScriptOpSymbols ctermfg=203 ctermbg=NONE cterm=NONE
hi javaScriptOperator ctermfg=185 ctermbg=NONE cterm=NONE
hi javaScriptParens ctermfg=153 ctermbg=NONE cterm=NONE
hi javascriptDocNamedParamType ctermfg=66 ctermbg=NONE cterm=NONE
hi javascriptDocNotation ctermfg=242 ctermbg=NONE cterm=NONE
hi javascriptDocParamName ctermfg=58 ctermbg=NONE cterm=NONE
hi javascriptDocParamType ctermfg=66 ctermbg=NONE cterm=NONE
hi javascriptFuncName ctermfg=185 ctermbg=NONE cterm=NONE
hi javascriptObjectLabelColon ctermfg=203 ctermbg=NONE cterm=NONE
hi javascriptObjectMethodName ctermfg=185 ctermbg=NONE cterm=NONE
hi javascriptOpSymbol ctermfg=203 ctermbg=NONE cterm=NONE
hi javascriptRepeat ctermfg=185 ctermbg=NONE cterm=NONE
hi javascriptTemplateSB ctermfg=203 ctermbg=NONE cterm=NONE
hi jsArrowFunction ctermfg=142 ctermbg=NONE cterm=NONE
hi jsExport ctermfg=81 ctermbg=NONE cterm=NONE
hi jsExportDefault ctermfg=185 ctermbg=NONE cterm=NONE
hi jsExportDefaultGroup ctermfg=81 ctermbg=NONE cterm=NONE
hi jsFrom ctermfg=81 ctermbg=NONE cterm=NONE
hi jsFuncArgs ctermfg=215 ctermbg=NONE cterm=NONE
hi jsFuncName ctermfg=185 ctermbg=NONE cterm=NONE
hi jsFuncParens ctermfg=153 ctermbg=NONE cterm=NONE
hi jsFunctionKey ctermfg=185 ctermbg=NONE cterm=NONE
hi jsGlobalNodeObjects ctermfg=153 ctermbg=NONE cterm=NONE
hi jsGlobalObjects ctermfg=81 ctermbg=NONE cterm=NONE
hi jsImport ctermfg=81 ctermbg=NONE cterm=NONE
hi jsNull ctermfg=215 ctermbg=NONE cterm=NONE
hi jsObjectColon ctermfg=203 ctermbg=NONE cterm=NONE
hi jsObjectFuncName ctermfg=185 ctermbg=NONE cterm=NONE
hi jsObjectKey ctermfg=153 ctermbg=NONE cterm=NONE
hi jsParens ctermfg=153 ctermbg=NONE cterm=NONE
hi jsParensIfElse ctermfg=153 ctermbg=NONE cterm=NONE
hi jsRepeat ctermfg=185 ctermbg=NONE cterm=NONE
hi jsSpecial ctermfg=215 ctermbg=NONE cterm=NONE
hi jsTemplateBraces ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptAliasKeyword ctermfg=185 ctermbg=NONE cterm=NONE
hi typescriptArrowFuncArg ctermfg=215 ctermbg=NONE cterm=NONE
hi typescriptAssign ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptBinaryOp ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptCall ctermfg=215 ctermbg=NONE cterm=NONE
hi typescriptDotNotation ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptFuncName ctermfg=185 ctermbg=NONE cterm=NONE
hi typescriptIdentifierName ctermfg=255 ctermbg=NONE cterm=NONE
hi typescriptInterfaceKeyword ctermfg=185 ctermbg=NONE cterm=NONE
hi typescriptLabel ctermfg=185 ctermbg=NONE cterm=NONE
hi typescriptLogicSymbols ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptMemberOptionality ctermfg=215 ctermbg=NONE cterm=NONE
hi typescriptObjectLabel ctermfg=153 ctermbg=NONE cterm=NONE
hi typescriptOperator ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptOptionalMark ctermfg=215 ctermbg=NONE cterm=NONE
hi typescriptParamImpl ctermfg=215 ctermbg=NONE cterm=NONE
hi typescriptParens ctermfg=153 ctermbg=NONE cterm=NONE
hi typescriptRepeat ctermfg=185 ctermbg=NONE cterm=NONE
hi typescriptReserved ctermfg=81 ctermbg=NONE cterm=NONE
hi typescriptStatementKeyword ctermfg=81 ctermbg=NONE cterm=NONE
hi typescriptTemplateSB ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptTernaryOp ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptTypeAnnotation ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptUnaryOp ctermfg=203 ctermbg=NONE cterm=NONE
hi typescriptVariable ctermfg=81 ctermbg=NONE cterm=NONE
