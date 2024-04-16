{pkgs, ...}: #vim.opt.fillchars = 'eob: ' <-- changes eob from ~ to spaces (works better with opacity)

{
    programs.neovim = {
        enable = true;
        extraLuaConfig = ''
            require("onivim")
            vim.opt.fillchars = 'eob: '
            print('hello')
            '';
        plugins = with pkgs.vimPlugins;
        let 
            onivim = pkgs.vimUtils.buildVimPlugin { #can also fetch from github
                name = "onivim";
                src = ./nvim;
            };
        in 
            [

            ### VISUAL ###
            kanagawa-nvim
            bufferline-nvim
            nvim-tree-lua
            nvim-web-devicons
            lualine-nvim
            nvim-colorizer-lua # show colors that were written
            indent-blankline-nvim # show indentation lines
            dressing-nvim #makes the pop uis for input and select look nicer
            #telescope
                plenary-nvim
                telescope-nvim
            #bufdeletion without messing up window layout
                nvim-bufdel
            #github
                gitsigns-nvim
            #lsp
                nvim-lspconfig
            #autocompletion
                nvim-cmp
                cmp-nvim-lsp
                cmp_luasnip
                cmp-path
                cmp-buffer
            #discord
                presence-nvim

            #auto pairs of special characters and tags
                nvim-autopairs
                nvim-ts-autotag
            #snippets
                friendly-snippets
                luasnip
            #neodev to see vim configs/apis
                neodev-nvim
            #treesitter
                nvim-treesitter.withAllGrammars

                onivim # my config file

                ];
        extraPackages = with pkgs; [
            wl-clipboard
                lua-language-server
                nixd
                nodePackages.vscode-langservers-extracted
                nodePackages.typescript-language-server
        ];
    };
}
