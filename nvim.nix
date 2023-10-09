pkgs: 
{ 
  enable = true; 
  extraLuaConfig = ''
  		     require("onivim")
             vim.cmd("colorscheme kanagawa")
             require("nvim-autopairs").setup {}
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

      #visual
      kanagawa-nvim
      barbar-nvim
      nvim-tree-lua
      nvim-web-devicons
      lualine-nvim
      nvim-colorizer-lua # show colors that were written
      indent-blankline-nvim # show indentation lines

      #telescope
      plenary-nvim
      telescope-nvim

      #github
      gitsigns-nvim

      #lsp
      nvim-lspconfig

      #autocompletion
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      nvim-autopairs

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
    rnix-lsp
  ];
}
