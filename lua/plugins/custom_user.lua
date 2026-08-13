local home_dir = os.getenv "HOME"

-- 根据条件设置 loaded_node_provider
local node_provider = home_dir == "/root" and 0 or nil

---@type LazySpec
return {
  {
    "AstroNvim/AstroNvim",
    opts = {
      rocks = {
        enabled = false, -- 禁用 luarocks 支持
        hererocks = false, -- 同时禁用 hererocks 检测
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        g = {
          -- 配置 vim.g 变量
          loaded_perl_provider = 0, -- 禁用 Perl 支持
          loaded_ruby_provider = 0, -- 禁用 Ruby 支持
          loaded_node_provider = node_provider, -- 根据条件设置 Node 支持
          python3_host_prog = home_dir .. "/dotfiles/uv/.venv/bin/python3.12", -- 指定 Python 3 路径
        },

        opt = {
          fileencodings = "ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,default,big5,euc-jp,euc-kr,latin1",
        },
      },
      autocmds = {
        json_format = {
          {
            event = "FileType",
            pattern = { "json", "jsonc" },
            desc = "Format: json→jq, jsonc→biome",
            callback = function()
              local ft = vim.bo.filetype
              if ft == "json" then
                vim.keymap.set("n", "<Leader>lf", function()
                  vim.cmd("%!jq .")
                end, { buffer = true, desc = "Format JSON with jq" })
              else
                vim.keymap.set("n", "<Leader>lf", function()
                  vim.cmd("%!~/.local/share/nvim/mason/bin/biome format --stdin-file-path=dummy.jsonc")
                end, { buffer = true, desc = "Format JSONC with biome" })
              end
            end,
          },
          {
            event = "BufWritePre",
            pattern = { "*.json", "*.jsonc" },
            desc = "Auto-format JSON/JSONC on save",
            callback = function()
              if vim.b.autoformat ~= false then
                local ft = vim.bo.filetype
                if ft == "json" then
                  vim.cmd("%!jq .")
                elseif ft == "jsonc" then
                  vim.cmd("%!~/.local/share/nvim/mason/bin/biome format --stdin-file-path=dummy.jsonc")
                end
              end
            end,
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      formatting = {
        disabled = {
          "jsonls",  -- 禁用 json-lsp 的格式化（json→jq, jsonc→biome）
          "null-ls", -- 禁用 none-ls 的格式化（不干扰 autocmd mapping）
        },
      },
    },
  },
}
