if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- configure vim.opt options
        -- configure font
        guifont = "FiraCode Nerd Font Mono:h12:#e-subpixelantialias",
        guifontwide = "Sarasa Fixed SC Semi-Bold:h12:#e-subpixelantialias",
        -- line spacing
        linespace = 0,
        cmdheight = 1,
      },
    },
  },
}
