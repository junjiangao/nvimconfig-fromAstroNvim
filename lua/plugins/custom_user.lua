local home_dir = os.getenv "HOME"

-- 根据条件设置 loaded_node_provider
local node_provider = home_dir == "/root" and 0 or 1

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      g = {
        -- 配置 vim.g 变量
        loaded_perl_provider = 0, -- 禁用 Perl 支持
        loaded_ruby_provider = 0, -- 禁用 Ruby 支持
        loaded_node_provider = node_provider, -- 根据条件设置 Node 支持
      },

      opt = {
        fileencodings = "ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,default,big5,euc-jp,euc-kr,latin1",
      },
    },
  },
}
