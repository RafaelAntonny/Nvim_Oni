vim.g.barbar_auto_setup = false

require'barbar'.setup {
    --what to do if there is a supported sidebar
    --I have NvimTree so I say that it is NvimTree and I say for it to call the NvimTree buffer "File-Tree"
    -- sidebar_filetypes = {
    --    NvimTree = {event = 'BufWinLeave', text = 'File-Tree'},
    -- },
}
