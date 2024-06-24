{self, ...}:
{
 colorschemes.dracula.enable = true;

 plugins = {
   lsp = {
     enable = true;
     servers = { 
	     tsserver.enable = true;

       clangd.enable = true;

       nixd.enable = true;
     };
   };

   cmp = {
     enable = true;

     settings = {
       
       sources = [
         { name = "nvim-lsp";}
         { name = "clangd";}
         { name = "buffer";}
         { name = "path";}
         { name = "fish";}
       ];

       mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" =
            # lua 
            ''
              function(fallback)
                local line = vim.api.nvim_get_current_line()
                if line:match("^%s*$") then
                  fallback()
                elseif cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                  fallback()
                end
              end
            '';
          "<Down>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<Up>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
     };
   };

   cmp-nvim-lsp.enable = true;
   cmp-buffer.enable = true;
   cmp-path.enable = true;
   cmp-fish.enable = true;
   cmp-emoji.enable = true;
   cmp_luasnip.enable = true;

   neocord = {
     enable = true;
   };

   telescope = {
     enable = true;
     keymaps = {
	"<C-p>" = "live_grep";
         "<leader>fg" = {
         action = "git_files";

         options = {
           desc = "Telescope Git Files";
         };
       };
     };
     extensions.fzf-native.enable = true;
   };

   oil.enable = true;

   #treesitter
   treesitter = {
      enable = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };
    rainbow-delimiters.enable = true;

   luasnip.enable = true;

   lightline.enable = true;

   nvim-tree = {
    enable = true;
    openOnSetupFile = true;
    autoReloadOnWrite = true;
  };

   toggleterm = {
     enable = true;
     settings = {
       open_mapping = "[[<C-t>]]";
     };
   };

   which-key.enable = true;

   copilot-chat.enable = true;
   copilot-lua = {
     enable = true;
     suggestion.enabled = false;
     panel.enabled = false;
   };
 };

 globals.mapleader = " ";
 keymaps = [
   {
    key = "<C-n>";
    action = "<CMD>NvimTreeToggle<CR>";
    options.desc = "Toggle NvimTree";
   }
   {
    key = "<leader>c";
    action = "+context";
   }
   {
    key = "<leader>co";
    action = "<CMD>TSContextToggle<CR>";
    options.desc = "Toggle Treesitter context";
   }

   #copilot chat
   {
      key = "<leader>co";
      action = "<CMD>TSContextToggle<CR>";
      options.desc = "Toggle Treesitter context";
    }
    {
      key = "<leader>ct";
      action = "<CMD>CopilotChatToggle<CR>";
      options.desc = "Toggle Copilot Chat Window";
    }
    {
      key = "<leader>cf";
      action = "<CMD>CopilotChatFix<CR>";
      options.desc = "Fix the selected code";
    }
    {
      key = "<leader>cs";
      action = "<CMD>CopilotChatStop<CR>";
      options.desc = "Stop current Copilot output";
    }
    {
      key = "<leader>cr";
      action = "<CMD>CopilotChatReview<CR>";
      options.desc = "Review the selected code";
    }
    {
      key = "<leader>ce";
      action = "<CMD>CopilotChatExplain<CR>";
      options.desc = "Give an explanation for the selected code";
    }
    {
      key = "<leader>cd";
      action = "<CMD>CopilotChatDocs<CR>";
      options.desc = "Add documentation for the selection";
    }
    {
      key = "<leader>cp";
      action = "<CMD>CopilotChatTests<CR>";
      options.desc = "Add tests for my code";
    }
 ];

}
