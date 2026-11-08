-- Dark Alabaster with colors from Rosé Pine (main).
-- Based on dchinmay2/alabaster.nvim (see LICENSES/alabaster.nvim).
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "rose-dark"

local p = {
    base = "#191724",
    surface = "#1f1d2e",
    overlay = "#26233a",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#e0def4",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ebbcba",
    pine = "#31748f",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    highlight_low = "#21202e",
    highlight_med = "#403d52",
    highlight_high = "#524f67",
}

local function blend(color, base, alpha)
    local function channel(hex, i)
        return tonumber(hex:sub(i, i + 1), 16)
    end
    local out = "#"
    for _, i in ipairs({ 2, 4, 6 }) do
        local c, b = channel(color, i), channel(base, i)
        out = out .. string.format("%02x", math.floor(b + (c - b) * alpha + 0.5))
    end
    return out
end

vim.g.terminal_color_0 = p.overlay
vim.g.terminal_color_1 = p.love
vim.g.terminal_color_2 = p.pine
vim.g.terminal_color_3 = p.gold
vim.g.terminal_color_4 = p.foam
vim.g.terminal_color_5 = p.iris
vim.g.terminal_color_6 = p.rose
vim.g.terminal_color_7 = p.text
vim.g.terminal_color_8 = p.muted
vim.g.terminal_color_9 = p.love
vim.g.terminal_color_10 = p.pine
vim.g.terminal_color_11 = p.gold
vim.g.terminal_color_12 = p.foam
vim.g.terminal_color_13 = p.iris
vim.g.terminal_color_14 = p.rose
vim.g.terminal_color_15 = p.text

local bg = p.base
local fg = p.text
local punct_fg = p.subtle
local bracket_fg = blend(p.text, p.subtle, 0.5)
local def_fg = p.iris
local const_fg = p.rose
local active = p.gold
local string_fg = p.foam
local darker_fg = p.muted
local diffadd = p.foam
local diffdelete = p.love
local diffchange = p.gold
local statusline = p.surface
local comment = p.gold
local dim_comment = p.muted
local mistake = {
    fg = p.love,
    bg = blend(p.love, bg, 0.15),
}
local error = p.love
local warn = p.gold
local hint = p.iris
local info = p.foam
local ansi = {
    black = p.overlay,
    blue = p.foam,
    brightyellow = p.gold,
    cyan = p.rose,
    green = p.pine,
    magenta = p.iris,
    red = p.love,
    white = p.text,
    yellow = p.gold,
}
local selection = blend(p.pine, bg, 0.45)
local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
local pmenu_bg = p.surface
local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
local floatborder = vim.g.alabaster_floatborder and { bg = bg, fg = p.highlight_med }
    or {
        bg = float_bg,
        fg = float_bg,
    }

local theme = {
    Comment = { fg = comment_fg },
    ColorColumn = { bg = p.highlight_low },
    Conceal = { fg = p.subtle },
    Cursor = { bg = active, fg = bg },
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = p.highlight_low },
    CursorLine = { bg = p.highlight_low },
    Directory = { fg = ansi.blue },
    DiffAdd = { bg = blend(diffadd, bg, 0.15), fg = diffadd },
    DiffDelete = { bg = blend(diffdelete, bg, 0.15), fg = diffdelete },
    DiffText = { fg = bg, bg = diffchange },
    DiffChange = { bg = blend(diffchange, bg, 0.12), fg = diffchange },
    EndOfBuffer = { fg = p.highlight_med },
    -- TermCursor   { }, -- cursor in a focused terminal
    TermCursorNC = { fg = bg, bg = fg },
    ErrorMsg = { fg = error, bg = mistake.bg },
    VertSplit = { fg = p.highlight_med },
    Folded = { bg = p.highlight_low, fg = p.muted },
    FoldColumn = { bg = bg, fg = p.highlight_high },
    SignColumn = {},
    IncSearch = { bg = ansi.yellow, fg = bg },
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr = { fg = p.muted },
    CursorLineNr = { fg = ansi.blue, bold = 1 },
    MatchParen = { underline = 1, sp = active },
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = ansi.green, bold = 1 },
    NonText = { fg = p.muted },
    Normal = { bg = bg, fg = fg },
    NormalFloat = { bg = float_bg },
    -- NormalNC     { }, -- normal text in non-current windows
    FloatBorder = floatborder,
    Pmenu = { bg = pmenu_bg },
    PmenuSel = { bg = selection },
    PmenuSbar = { bg = p.overlay },
    PmenuThumb = { bg = p.highlight_high },
    Question = { fg = diffadd },
    QuickFixLine = { bg = p.highlight_low },
    Search = { bg = selection },
    SpecialKey = { fg = ansi.cyan },
    SpellBad = { undercurl = 1, sp = ansi.red },
    SpellCap = { undercurl = 1, sp = ansi.blue },
    SpellLocal = { undercurl = 1, sp = ansi.cyan },
    SpellRare = { undercurl = 1, sp = ansi.magenta },
    StatusLine = { bg = statusline, fg = fg },
    StatusLineNC = { bg = statusline, fg = p.subtle },
    TabLine = { bg = statusline, fg = p.muted },
    TabLineFill = { bg = statusline },
    TabLineSel = { bg = statusline, fg = ansi.blue },
    Title = { fg = const_fg },
    Visual = { bg = blend(p.iris, bg, 0.2) },
    VisualNOS = { bg = blend(p.iris, bg, 0.2) },
    WarningMsg = { fg = p.gold },
    WildMenu = { bg = selection },
    WinBar = { bg = bg, fg = ansi.white, bold = true },
    WinBarNC = { bg = bg, fg = p.muted },

    --- SYNTAX I: TS groups link to these
    Constant = { fg = const_fg },
    String = { fg = string_fg },
    Character = { fg = const_fg },
    Number = { fg = const_fg },
    Boolean = { fg = const_fg },
    Float = { fg = const_fg },
    Operator = { fg = punct_fg },

    --- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
    Identifier = { fg = ansi.white },
    Function = { fg = def_fg },
    Statement = { fg = ansi.white },
    Conditional = { fg = ansi.white },
    Repeat = { fg = ansi.white },
    Label = { fg = def_fg },
    Keyword = { fg = ansi.white },
    Exception = { fg = ansi.white },
    PreProc = { fg = ansi.white },
    Include = { fg = ansi.white },
    Define = { fg = ansi.white },
    Macro = { fg = ansi.white },
    PreCondit = { fg = ansi.white },
    Type = { fg = ansi.white },
    StorageClass = { fg = ansi.white },
    Structure = { fg = def_fg },
    Typedef = { fg = def_fg },

    Special = { fg = ansi.yellow },
    -- TODO better color than diffchange, try reddish
    -- SpecialChar = { fg = diffchange }, --  special character in a constant
    -- Tag            { }, --    you can use CTRL-] on this
    -- Delimiter      { },
    SpecialComment = { bg = p.overlay, fg = ansi.blue },
    debugPc = { bg = blend(p.pine, bg, 0.3) },
    debugBreakpoint = { bg = blend(p.love, bg, 0.5) },
    helpHyperTextJump = { fg = ansi.magenta },
    helpSectionDelim = { fg = ansi.magenta },
    helpExample = { fg = ansi.cyan },
    helpCommand = { fg = ansi.cyan },
    helpHeadline = { fg = ansi.blue },
    helpHeader = { fg = ansi.magenta },

    Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
    Italic = { italic = 1 },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { bg = mistake.bg, fg = mistake.fg },

    Todo = { bg = p.gold, fg = bg },

    --- Diagnostic
    LspReferenceText = { bg = p.highlight_med },
    LspReferenceRead = { bg = p.highlight_med },
    LspReferenceWrite = { bg = p.highlight_med, underline = 1, sp = active },
    LspCodeLens = { fg = p.muted },
    LspCodeLensSeparator = { fg = p.muted },

    --- Diagnostic
    DiagnosticError = { fg = error },
    DiagnosticWarn = { fg = warn },
    DiagnosticHint = { fg = hint },
    DiagnosticInfo = { fg = info },
    DiagnosticVirtualTextError = { bg = blend(error, bg, 0.12), fg = error },
    DiagnosticVirtualTextWarn = { bg = blend(warn, bg, 0.12), fg = warn },
    DiagnosticVirtualTextHint = { bg = blend(hint, bg, 0.12), fg = hint },
    DiagnosticVirtualTextInfo = { bg = blend(info, bg, 0.12), fg = info },

    --- Treesitter
    TSAttribute = {},
    TSConstructor = { fg = ansi.white },
    TSConditional = { fg = ansi.white },
    TSConstBuiltin = { fg = const_fg },
    TSConstMacro = { fg = ansi.white },
    TSError = { bg = mistake.bg, fg = mistake.fg },
    TSException = { fg = ansi.white },
    TSField = { fg = ansi.white },
    TSFunction = { fg = ansi.white },
    TSFuncBuiltin = { fg = ansi.white },
    TSFuncMacro = { fg = ansi.white },
    TSKeyword = { fg = ansi.white },
    TSKeywordFunction = { fg = ansi.white },
    TSLabel = { fg = ansi.white },
    TSMethod = { fg = ansi.white },
    TSNamespace = { fg = ansi.white },
    TSNone = { fg = const_fg },
    TSParameter = { fg = ansi.white },
    TSParameterReference = { fg = ansi.white },
    TSProperty = { fg = ansi.white },
    TSPunctDelimiter = { fg = punct_fg },
    TSPunctBracket = { fg = bracket_fg },
    TSPunctSpecial = { fg = punct_fg },
    TSRepeat = { fg = ansi.white },
    TSString = { fg = string_fg },
    TSStringRegex = { bg = p.overlay, fg = const_fg },
    TSStringEscape = { bg = p.overlay, fg = const_fg },
    TSSymbol = {},
    TSType = { fg = ansi.white },
    TSTypeBuiltin = { fg = ansi.white },
    TSVariable = { fg = ansi.white },
    TSVariableBuiltin = { fg = ansi.white },
    TSTag = { fg = ansi.white },
    TSTagDelimiter = { fg = punct_fg },
    TSText = { fg = ansi.white },
    ["@attribute"] = {},
    ["@constructor"] = { fg = ansi.white },
    ["@conditional"] = { fg = ansi.white },
    ["@constant.builtin"] = { fg = const_fg },
    ["@constant.macro"] = { fg = ansi.white },
    ["@error"] = { bg = mistake.bg, fg = mistake.fg },
    ["@exception"] = { fg = ansi.white },
    ["@field"] = { fg = ansi.white },
    ["@function"] = { fg = ansi.white },
    ["@function.builtin"] = { fg = ansi.white },
    ["@function.macro"] = { fg = ansi.white },
    ["@keyword"] = { fg = ansi.white },
    ["@keyword.function"] = { fg = ansi.white },
    ["@keyword.operator"] = { fg = punct_fg },
    ["@label"] = { fg = ansi.white },
    ["@method"] = { fg = ansi.white },
    ["@module"] = { fg = ansi.white },
    ["@namespace"] = { fg = ansi.white },
    ["@none"] = { fg = const_fg },
    ["@parameter"] = { fg = ansi.white },
    ["@parameter.reference"] = { fg = ansi.white },
    ["@property"] = { fg = ansi.white },
    ["@punctuation.delimiter"] = { fg = punct_fg },
    ["@punctuation.bracket"] = { fg = bracket_fg },
    ["@punctuation.special"] = { fg = punct_fg },
    ["@repeat"] = { fg = ansi.white },
    ["@string"] = { fg = string_fg },
    ["@string.regex"] = { bg = p.overlay, fg = const_fg },
    ["@string.escape"] = { bg = p.overlay, fg = const_fg },
    ["@symbol"] = {},
    ["@type"] = { fg = ansi.white },
    ["@type.builtin"] = { fg = ansi.white },
    ["@variable"] = { fg = ansi.white },
    ["@variable.builtin"] = { fg = ansi.white },
    ["@tag"] = { fg = ansi.white },
    ["@tag.delimiter"] = { fg = punct_fg },
    ["@text"] = { fg = ansi.white },
    ["@text.note"] = { bg = p.overlay, fg = ansi.blue },
    ["@text.warning"] = { bg = p.gold, fg = bg },

    --- Theme specific
    ["@AlabasterBase"] = { fg = ansi.white },
    ["@AlabasterConstant"] = { fg = const_fg },
    ["@AlabasterDefinition"] = { fg = def_fg },
    ["@AlabasterPunct"] = { fg = punct_fg },
    ["@AlabasterString"] = { fg = string_fg },
    ["@AlabasterHashbang"] = { fg = dim_comment },
    --- Gitsigns
    GitSignsAdd = { fg = diffadd },
    GitSignsChange = { fg = diffchange },
    GitSignsDelete = { fg = diffdelete },
    --- Telescope
    TelescopeBorder = { fg = p.highlight_med },
    TelescopeMatching = { fg = p.gold },
    TelescopeMultiSelection = { fg = ansi.magenta },
    TelescopePromptPrefix = { fg = ansi.blue },
    TelescopeSelectionCaret = { fg = mistake.fg },
    TelescopeTitle = { fg = ansi.brightyellow },
    TelescopeResultsTitle = { fg = ansi.yellow },
    --- fzf-lua
    FzfLuaBorder = { fg = p.highlight_med },
    --- mini.nvim
    MiniPickMatchCurrent  = { fg = p.gold },
    --- Neogit
    NeogitPopupActionDisabled = { fg = darker_fg },
    NeogitPopupActionKey = { fg = ansi.magenta },
    NeogitPopupOptionDisabled = { fg = darker_fg },
    NeogitPopupOptionKey = { fg = ansi.blue },
    NeogitPopupSwitchDisabled = { fg = darker_fg },
    NeogitPopupSwitchEnabled = { fg = ansi.cyan },
    NeogitPopupSwitchKey = { fg = ansi.magenta },
    --- Fugitive
    diffAdded = { link = "DiffAdd" },
    diffRemoved = { link = "DiffDelete" },
    --- Startify
    StartifyBracket = { fg = darker_fg },
    StartifyFile = { fg = ansi.white },
    StartifySection = { fg = ansi.green },
    StartifySlash = { fg = p.muted },
    StartifyPath = { fg = p.muted },
    --- Statusline
    StatuslineAdd = { fg = diffadd, bg = statusline },
    StatuslineErr = { fg = error, bg = statusline },
    StatuslineHint = { fg = hint, bg = statusline },
    StatuslineInfo = { fg = info, bg = statusline },
    StatuslineWarn = { fg = warn, bg = statusline },
    StatuslineBlue = { fg = ansi.blue, bg = statusline },
    StatuslineRed = { fg = ansi.red, bg = statusline },
    StatuslineGreen = { fg = ansi.green, bg = statusline },
    StatuslineCyan = { fg = ansi.cyan, bg = statusline },
    StatuslineMagenta = { fg = ansi.magenta, bg = statusline },
    --- ALE
    ALEWarningSign = { fg = warn },
    --- vim-matchup
    MatchupVirtualText = { fg = ansi.yellow },
    --- For `highlight link`
    AlabasterBlack = { fg = ansi.black },
    AlabasterBlue = { fg = ansi.blue },
    AlabasterBrightYellow = { fg = ansi.brightyellow },
    AlabasterCyan = { fg = ansi.cyan },
    AlabasterGreen = { fg = ansi.green },
    AlabasterDarkGreen = { fg = p.pine },
    AlabasterMagenta = { fg = ansi.magenta },
    AlabasterRed = { fg = ansi.red },
    AlabasterWhite = { fg = ansi.white },
    AlabasterYellow = { fg = ansi.yellow },
    --- Hop
    HopNextKey = { fg = ansi.brightyellow },
    HopNextKey1 = { fg = ansi.cyan },
    HopNextKey2 = { fg = p.pine },
    HopUnmatched = { fg = p.highlight_med },
    --- Lightspeed
    LightspeedGreyWash = { fg = p.highlight_med },
    --- checkhealth
    healthSuccess = { fg = ansi.green, bg = bg },
    --- cmp
    CmpItemMenuDefault = { fg = ansi.magenta },
    --- nvim-ts-rainbow
    rainbowcol1 = { fg = ansi.yellow },
    rainbowcol2 = { fg = ansi.magenta },
    rainbowcol3 = { fg = ansi.blue },
    rainbowcol4 = { fg = ansi.green },
    rainbowcol5 = { fg = ansi.brightyellow },
    rainbowcol6 = { fg = ansi.red },
    rainbowcol7 = { fg = ansi.cyan },
    --- Iswap
    ISwapSnipe = { bg = ansi.yellow, fg = bg },
    ISwapGrey = { fg = p.highlight_med },
    --- vim-dadbod-ui
    dbui_help = { fg = dim_comment },
    dbui_connection_source = { fg = dim_comment },
    --- nvim-dap-virtual-text
    NvimDapVirtualText = { bg = p.overlay, fg = ansi.cyan },
    --- Noice
    NoiceCmdlineIcon = { link = "AlabasterDarkGreen" },
    NoiceCmdlinePopupBorder = { link = "AlabasterDarkGreen" },
    NoiceConfirmBorder = { link = "AlabasterDarkGreen" },
    NoiceCmdlinePopupBorderCmdline = { link = "AlabasterDarkGreen" },
    NoiceCmdlineIconCmdline = { link = "AlabasterDarkGreen" },
    NoiceCmdlinePopupBorderFilter = { link = "AlabasterDarkGreen" },
    NoiceCmdlineIconFilter = { link = "AlabasterDarkGreen" },
    NoiceCmdlinePopupBorderLua = { link = "AlabasterDarkGreen" },
    NoiceCmdlineIconLua = { link = "AlabasterDarkGreen" },
    NoiceCmdlinePopupBorderSearch = { link = "AlabasterYellow" },
    NoiceCmdlineIconSearch = { link = "AlabasterYellow" },
    -- Languages
    --- asm
    asmDirective = { fg = dim_comment },
    nasmLabel = { link = "@AlabasterDefinition" },

    ["@lsp.mod.declaration"] = { fg = fg },
    ["@lsp.type.enumMember"] = { fg = fg },
    ["@lsp.type.function"] = { fg = fg },
    ["@lsp.type.method"] = { fg = fg },
    ["@lsp.type.selfKeyword"] = { fg = fg },
    ["@lsp.typemod.class.declaration"] = { fg = def_fg },
    ["@lsp.typemod.class.definition"] = { fg = def_fg },
    ["@lsp.typemod.enum.declaration"] = { fg = def_fg },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = fg },
    ["@lsp.typemod.function.declaration"] = { fg = def_fg },
    ["@lsp.typemod.function.definition"] = { fg = def_fg },
    ["@lsp.typemod.macro.declaration"] = { fg = def_fg },
    ["@lsp.typemod.method.declaration"] = { fg = def_fg },
    ["@lsp.typemod.selfKeyword"] = { fg = fg },
    ["@lsp.typemod.struct.declaration"] = { fg = def_fg },
    ["@lsp.typemod.type.declaration"] = { fg = def_fg },
}

for group, hl in pairs(theme) do
    vim.api.nvim_set_hl(0, group, hl)
end
