 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#23231a',
    base01 = '#3b3b2b',
    base02 = '#363626',
    base03 = '#6c6d5d',
    base04 = '#b6b6af',
    base05 = '#f3f3f2',
    base06 = '#f3f3f2',
    base07 = '#f3f3f2',
    base08 = '#fd4663',
    base09 = '#85ad85',
    base0A = '#99b181',
    base0B = '#c1c18b',
    base0C = '#afd0af',
    base0D = '#d3d3ac',
    base0E = '#bfd0af',
    base0F = '#741d2b',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f3f3f2',          bg = '#23231a' })
  hi('TelescopeBorder',         { fg = '#6c6d5d',             bg = '#23231a' })
  hi('TelescopePromptNormal',   { fg = '#f3f3f2',          bg = '#23231a' })
  hi('TelescopePromptBorder',   { fg = '#6c6d5d',             bg = '#23231a' })
  hi('TelescopePromptPrefix',   { fg = '#c1c18b',             bg = '#23231a' })
  hi('TelescopePromptCounter',  { fg = '#b6b6af',  bg = '#23231a' })
  hi('TelescopePromptTitle',    { fg = '#23231a',             bg = '#c1c18b' })
  hi('TelescopePreviewTitle',   { fg = '#23231a',             bg = '#99b181' })
  hi('TelescopeResultsTitle',   { fg = '#23231a',             bg = '#85ad85' })
  hi('TelescopeSelection',      { fg = '#f3f3f2',          bg = '#363626' })
  hi('TelescopeSelectionCaret', { fg = '#c1c18b',             bg = '#363626' })
  hi('TelescopeMatching',       { fg = '#c1c18b',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
