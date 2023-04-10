return function()
  vim.g.closetag_filenames = {
    "*.html",
    "*.jsx",
    "*.js",
    "*.tsx",
  }

  vim.g.closetag_xhtml_filenames = {
    "*.jsx",
    "*.js",
    "*.tsx",
  }
  
  vim.g.closetag_filetypes = {
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  }

  vim.g.closetag_xhtml_filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  }

  vim.g.closetag_emptyTags_caseSensitive = 1

  vim.g.closetag_regions = {
    typescriptreact = "jsxRegion,tsxRegion",
    javascriptreact = "jsxRegion",
  }
end
