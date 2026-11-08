# alabaster-rose.nvim

[Alabaster](https://tonsky.me/blog/syntax-highlighting/)-style colorschemes for Neovim with colors from [Rosé Pine](https://rosepinetheme.com).

- `rose` - a light variant or `rose-dark`, depending on `'background'`
- `rose-light` - highlights on backgrounds, white background
- `rose-light-bg` - `rose-light` on a mild Rosé Pine Dawn background
- `rose-dark` - highlights as text colors, Rosé Pine background

`rose` is just a thin wrapper that calls into one light theme and one dark theme based on the current background.
The light theme is `rose-light` by default. To use `rose-light-bg` instead, set this before loading the colorscheme:

```lua
vim.g.rose_light = 'rose-light-bg'
```

The light theme is just a simple Vimscript theme, the dark theme is a Neovim Lua theme. The reason for this split is
that they come from different sources and I've pretty much just updated the colors here. At some point in the future
these may become more consistent.

The repo is called `alabaster-rose.nvim` for searchability but the themes are named just `rose*` for convenience.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    'stancl/alabaster-rose.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'dchinmay2/alabaster.nvim' },
    config = function()
        vim.cmd.colorscheme 'rose'
    end,
}
```

`alabaster.nvim` is optional but recommended: `rose-dark` uses its tree-sitter queries to highlight definitions and constants in more languages.

## Credits

- the main concept comes from [this blog post](https://tonsky.me/blog/syntax-highlighting/)
- `rose-light` and `rose-light-bg` are based on `alabaster-bg` from [sderev/alabaster.vim](https://github.com/sderev/alabaster.vim)
- `rose-dark` is based on [dchinmay2/alabaster.nvim](https://github.com/dchinmay2/alabaster.nvim)
- colors are based on the [Rosé Pine palette](https://rosepinetheme.com/en/palette/)

Their licenses are in [`LICENSES/`](LICENSES).

## Future work

Some leftovers from the original themes that haven't been updated yet:

- the light themes' cterm values still approximate the original Alabaster colors, so they only look right with `termguicolors` (on by default in Neovim with a truecolor terminal)
- some variable names and comments in the light themes still describe the original colors (e.g. `fg_black`, `bg_blue_menu`)
- options still use the original names: `g:alabaster_bg_prog_languages` in the light themes, `g:alabaster_dim_comments` and `g:alabaster_floatborder` in `rose-dark`

Also, the two themes being implemented quite differently leads to inconsistencies, where the light version *over*highlights while the
dark version *under*highlights, relative to what Alabaster-style themes are meant to do based on the original blog post:

- the light themes set classic Vim highlight groups, which are too broad: every function call gets the definition background (not just
  definitions), and keywords are colored like constants
- the dark theme sets the more specific tree-sitter groups and matches the blog post, but highlighting definitions relies on
  `alabaster.nvim`'s queries or LSP semantic tokens, so in languages without those queries (e.g. PHP) definitions stay plain, apart from
  what an attached LSP may provide through semantic tokens

This isn't really a problem for me now, so it's a larger task for the future: porting the light themes to the dark theme's highlight
groups (so both highlight the same things), and adding queries for missing languages.
