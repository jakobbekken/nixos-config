require("nvim-tree").setup({
  view = {
    width = 25,
    side = "right",
  },
  renderer = {
    root_folder_modifier = ":t",
  },
})
