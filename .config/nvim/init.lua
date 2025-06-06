vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim',
    },
    version = '1.*'
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
    version = '1.*'
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
    version = '1.*'
  },
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {},
    version = '3.*'
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function(_, opts)
      require("onedarkpro").setup(opts)
      vim.cmd("colorscheme onedark_dark")
    end,
    event = "VeryLazy",
    opts = {
      colors = {
        red = "#F03030",
        yellow = "#FFFF00",
      },
      highlights = {
        -- help treesitter-highlight-groups
        Comment = { italic = true },
        PMenuSel = { bg = "#004040" },
        Visual = { bg = "#4F4F4F" },
        LspReferenceText = { bg = "#303030" },
      },
    },
    version = '2.*'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'olimorris/onedarkpro.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {
      indent = {
        char = '▏',
      },
      scope = {
        show_start = false,
      },
    },
    version = '3.*'
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function(_, opts)
      require('telescope').setup(opts)
      pcall(require('telescope').load_extension, 'fzf')
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function(_, opts)
      local configs = require("nvim-treesitter.configs")

      configs.setup(opts)
    end,
    event = 'VeryLazy',
    opts = {
      ensure_installed = {},

      auto_install = true,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = false,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ['<Leader>nf'] = '@function.outer',
            ['<Leader>nc'] = '@class.outer',
          },
          goto_next_end = {
            ['<Leader>nF'] = '@function.outer',
            ['<Leader>nC'] = '@class.outer',
          },
          goto_previous_start = {
            ['<Leader>pf'] = '@function.outer',
            ['<Leader>pF'] = '@class.outer',
          },
          goto_previous_end = {
            ['<Leader>pF'] = '@function.outer',
            ['<Leader>pC'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>Sn'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>Sp'] = '@parameter.inner',
          },
        },
      },
    }
  },
  {
    "rmagatti/auto-session",
    config = function(_, opts)
      require("auto-session").setup(opts)
    end,
    lazy = false,
    opts = {
      log_level = "error",
      suppressed_dirs = { "~/Projects", "~/Downloads", "/" }
    },
    version = '2.*'
  },
  {
    'nmac427/guess-indent.nvim',
    event = "VeryLazy",
    opts = {},
  },
}, {
  defaults = {
    lazy = true,
  },
})

-- Settings

vim.o.hlsearch = false
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 500
vim.o.timeoutlen = 50
vim.o.completeopt = 'menuone,popup,noinsert,noselect,fuzzy'
vim.o.confirm = true
vim.o.inccommand = "nosplit" -- preview incremental substitute
vim.o.list = true
vim.o.scrolloff = 8
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.splitkeep = "topline"
vim.o.expandtab = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.virtualedit = "block"          -- Allow cursor to move where there is no text in visual block mode
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.winborder = 'single'
vim.o.wrap = false                   -- Disable line wrap
vim.cmd("let g:c_syntax_for_h = 1")

-- KEYBINDS (non-lsp)

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>sb', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes'))
end, { desc = '[s]earch current [b]uffer' })
vim.keymap.set('n', '<leader>sG', require('telescope.builtin').git_files, { desc = '[s]earch [G]it files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })

require('which-key').add({
  { '<leader>f', group = '[f]ormat' },
  { '<leader>s', group = '[s]earch' },
  { '<leader>n', group = '[n]ext' },
  { '<leader>p', group = '[p]revious' },
  { '<leader>S', group = '[S]wap' },
})

-- WGSL FILE DETECTION
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
    vim.o.commentstring = "// %s"
  end,
})

-- HIGHLIGHT ON YANK
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- LSP SETUP
vim.lsp.set_log_level("off")
local capabilities = vim.lsp.protocol.make_client_capabilities()
require('lspconfig').lua_ls.setup({
  capabilities = capabilities,
})
require('lspconfig').clangd.setup({
  capabilities = capabilities,
})
require('lspconfig').glsl_analyzer.setup({
  capabilities = capabilities,
})
require('lspconfig').rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
require('lspconfig').jedi_language_server.setup({})
require('lspconfig').wgsl_analyzer.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', '<leader>fb', vim.lsp.buf.format, { desc = '[f]ormat [b]uffer' })

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client == nil then
      vim.print('Could not get lsp client')
      return
    end
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
    if client:supports_method('textDocument/documentHighlight') then
      vim.api.nvim_create_autocmd('CursorHold', {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.document_highlight()
        end
      })
      vim.api.nvim_create_autocmd('CursorHoldI', {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.document_highlight()
        end
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.clear_references()
        end
      })
    end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    current_line = true,
  },
})
