return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      opts.model = "claude-sonnet-4.5"
      opts.sticky = { "#buffer:active" }
      return opts
    end,
  },
}
