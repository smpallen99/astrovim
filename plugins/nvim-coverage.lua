return {
  {
    "smpallen99/nvim-coverage",
    enabled = true,
    -- lazy = false,
    event = "BufEnter *.ex",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("coverage").setup() end,
  },
}
