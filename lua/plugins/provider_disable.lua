local home_dir = os.getenv "HOME"
if home_dir ~= "/root" then
  return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          -- configure vim.g variables
          loaded_perl_provider = 0,
          loaded_ruby_provider = 0,
        },
      },
    },
  }
else
  return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          -- configure vim.g variables
          loaded_perl_provider = 0,
          loaded_node_provider = 0,
          loaded_ruby_provider = 0,
        },
      },
    },
  }
end
