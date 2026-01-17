return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      opts.model = "gpt5.2"
      opts.sticky = { "#buffer:listed" }
      return opts
    end,
  },
}
