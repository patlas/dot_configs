-- Hide diagnostic (errors etc) show them using <leader>cd
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.virtual_text = false
    end,
  },
}
