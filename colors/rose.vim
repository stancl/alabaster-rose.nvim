""
" Name:        rose.vim
" Description: Picks the light or dark rose variant based on 'background'.
"              The light variant can be set with g:rose_light (default 'rose-light').
"""

if &background ==# 'dark'
  runtime colors/rose-dark.lua
else
  execute 'runtime colors/' . get(g:, 'rose_light', 'rose-light') . '.vim'
endif

let g:colors_name = 'rose'
