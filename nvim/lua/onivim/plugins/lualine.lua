-- will move to different file in future
local function lsp_name() -- this returns the name of the lsp
    local msg= 'No Lsp Detected'
    local buf_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_filetype) ~= -1 then
            return client.name
        end
    end
    return msg
end

-- will add more colors later on for more options
local colors = {
    waveRed = "#E46876",
    boatYellow2 = "#C0A36E",
    crystalBlue = "#7AA89F",
    oniViolet = "#957FB8",
    peachRed = "#FF5D62",
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    ignore_focus = {
        "NvimTree"
    },
    always_divide_middle = false,
    globalstatus = true,
    refresh = {
      statusline = 1000,
    }
  },

  sections = {
    lualine_a = {
        {'mode',
            icons_enabled = true,
            icon = ''
        }
    },
    lualine_b = {'branch',
        {'diff',
            symbols = {added = ' ', modified = ' ', removed = ' '}
        }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
        {'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint'},
            symbols = {error = ' ', warn = ' ', info = '󰋼 ', hint = '󰛨 '},
            diagnostics_color = {
                error = {fg = colors.waveRed},
                warn = {fg = colors.boatYellow2},
                info = {fg = colors.crystalBlue},
                hint = {fg = colors.oniViolet},
            },
            update_in_insert = true,
        },
        {lsp_name,
            icon = ' LSP:',
            color = {fg = colors.peachRed}
        },
        'filetype',
    },
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
