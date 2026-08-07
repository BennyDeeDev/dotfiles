return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = { "lsp" }
      return opts
    end,
  },
}
