return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua", "python", "typescript", "javascript", "html", "css", "json", "go", "rust", "java", "php", "c", "cpp", "cmake", "zsh",
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}

