-- Plugin definitions using lazy.nvim
return require('lazy').setup({
  -- Package manager automatically handles LSP servers, formatters etc.
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd' },
      }
    end,
  },

  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.clangd.setup {}
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      })
    end,
  },

  -- Treesitter for better syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'bash' },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- Telescope for fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Git integration and key helper
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'folke/which-key.nvim', opts = {} },

  -- Auto pairs and comments
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },
  { 'numToStr/Comment.nvim', config = true },

  -- Competitive programming helper
  {
    'xeluxee/competitest.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      require('competitest').setup {
        local_config_file_name = '.competitest.lua',

        floating_border = 'rounded',
        floating_border_highlight = 'FloatBorder',
        picker_ui = {
          width = 0.2,
          height = 0.3,
          mappings = {
            focus_next = { 'j', '<down>', '<Tab>' },
            focus_prev = { 'k', '<up>', '<S-Tab>' },
            close = { '<esc>', '<C-c>', 'q', 'Q' },
            submit = '<cr>',
          },
        },
        editor_ui = {
          popup_width = 0.4,
          popup_height = 0.6,
          show_nu = true,
          show_rnu = false,
          normal_mode_mappings = {
            switch_window = { '<C-h>', '<C-l>', '<C-i>' },
            save_and_close = '<C-s>',
            cancel = { 'q', 'Q' },
          },
          insert_mode_mappings = {
            switch_window = { '<C-h>', '<C-l>', '<C-i>' },
            save_and_close = '<C-s>',
            cancel = '<C-q>',
          },
        },
        runner_ui = {
          interface = 'popup',
          selector_show_nu = false,
          selector_show_rnu = false,
          show_nu = true,
          show_rnu = false,
          mappings = {
            run_again = 'R',
            run_all_again = '<C-r>',
            kill = 'K',
            kill_all = '<C-k>',
            view_input = { 'i', 'I' },
            view_output = { 'a', 'A' },
            view_stdout = { 'o', 'O' },
            view_stderr = { 'e', 'E' },
            toggle_diff = { 'd', 'D' },
            close = { 'q', 'Q' },
          },
          viewer = {
            width = 0.5,
            height = 0.5,
            show_nu = true,
            show_rnu = false,
            open_when_compilation_fails = true,
          },
        },
        popup_ui = {
          total_width = 0.8,
          total_height = 0.8,
          layout = {
            { 3, 'tc' },
            { 4, {
                { 1, 'so' },
                { 1, 'si' },
            } },
            { 4, {
                { 1, 'eo' },
                { 1, 'se' },
            } },
          },
        },
        split_ui = {
          position = 'right',
          relative_to_editor = true,
          total_width = 0.3,
          vertical_layout = {
            { 1, 'tc' },
            { 1, {
                { 1, 'so' },
                { 1, 'eo' },
            } },
            { 1, {
                { 1, 'si' },
                { 1, 'se' },
            } },
          },
          total_height = 0.4,
          horizontal_layout = {
            { 2, 'tc' },
            { 3, {
                { 1, 'so' },
                { 1, 'si' },
            } },
            { 3, {
                { 1, 'eo' },
                { 1, 'se' },
            } },
          },
        },

        save_current_file = true,
        save_all_files = false,
        compile_directory = '.',
        compile_command = {
          c = { exec = 'gcc', args = { '-Wall', '$(FNAME)', '-o', '$(FNOEXT)' } },
          cpp = { exec = 'g++', args = { '-Wall', '$(FNAME)', '-o', '$(FNOEXT)' } },
          rust = { exec = 'rustc', args = { '$(FNAME)' } },
          java = { exec = 'javac', args = { '$(FNAME)' } },
        },
        running_directory = '.',
        run_command = {
          c = { exec = './$(FNOEXT)' },
          cpp = { exec = './$(FNOEXT)' },
          rust = { exec = './$(FNOEXT)' },
          python = { exec = 'python', args = { '$(FNAME)' } },
          java = { exec = 'java', args = { '$(FNOEXT)' } },
        },
        multiple_testing = -1,
        maximum_time = 5000,
        output_compare_method = 'squish',
        view_output_diff = false,

        testcases_use_single_file = false,
        testcases_auto_detect_storage = true,
        testcases_single_file_format = '$(FNOEXT).testcases',
        testcases_input_file_format = '$(FNOEXT)_input$(TCNUM).txt',
        testcases_output_file_format = '$(FNOEXT)_output$(TCNUM).txt',
        testcases_directory = '.',

        companion_port = 27121,
        receive_print_message = true,
        start_receiving_persistently_on_setup = true,
        template_file = false,
        evaluate_template_modifiers = false,
        date_format = '%c',
        received_files_extension = 'cpp',
        received_problems_path = '~/Documents/Programming/$(PLATFORM)/$(CONTEST)/$(PROBLEM)/main.$(FEXT)',
        received_problems_prompt_path = false,
        received_contests_directory = '~/Documents/Programming/$(PLATFORM)/$(CONTEST)',
        received_contests_problems_path = '$(PROBLEM)/main.$(FEXT)',
        received_contests_prompt_directory = false,
        received_contests_prompt_extension = false,
        open_received_problems = true,
        open_received_contests = true,
        replace_received_testcases = false,
      }
    end,
  },
})
