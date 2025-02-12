if not vim.g.neovide then
  return {} -- do nothing if not in a Neovide session
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = { -- configure vim.opt options
        -- configure font 中文描述
        guifont = "FiraCode Nerd Font Mono,LXGW WenKai Mono:h12:#e-subpixelantialias",
        -- line spacing
        linespace = 0,
        cmdheight = 1,
      },
    },
  },
}
