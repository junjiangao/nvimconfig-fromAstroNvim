local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

return h.make_builtin({
  name = "jq",
  meta = {
    url = "https://jqlang.github.io/jq/",
    description = "Command-line JSON processor.",
  },
  method = FORMATTING,
  filetypes = { "json" },
  generator_opts = {
    command = "jq",
    args = { "." },
    to_stdin = true,
  },
  factory = h.formatter_factory,
})