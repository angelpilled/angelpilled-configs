-- Set Options
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoindent = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.softtabstop = 4
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.termguicolors = true
vim.opt.fillchars = {eob = " "}

-- Delete junk LaTeX files after exiting .tex documents in Neovim
vim.api.nvim_create_autocmd("QuitPre", {
    pattern = "*",
    -- command = "silent !rm *.log *.aux *.synctex.gz *.fls *.fdb_latexmk > /dev/null 2>&1"
    command = ":silent !rm *.log *.aux *.synctex.gz *.fls *.fdb_latexmk > /dev/null 2>&1"
})

-- Integraing Vimscript to lua with vim.cmd:
vim.cmd [[
call plug#begin()

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/neoclide/coc-pairs'
Plug 'https://github.com/numToStr/Comment.nvim' " Neovim Commenting
Plug 'https://github.com/ziontee113/color-picker.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/xiyaowong/telescope-emoji.nvim'
Plug 'https://github.com/MunifTanjim/nui.nvim'
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/andweeb/presence.nvim'
Plug 'https://github.com/nvim-telescope/telescope-file-browser.nvim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/nvim-neorg/neorg'
Plug 'https://github.com/andweeb/presence.nvim'
Plug 'https://github.com/catppuccin/nvim'
Plug 'https://github.com/lukas-reineke/headlines.nvim'
Plug 'https://github.com/folke/zen-mode.nvim'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/neoclide/coc-vimtex'
Plug 'https://github.com/derektata/lorem.nvim'
Plug 'https://github.com/iamcco/markdown-preview.nvim'

call plug#end()
]]

-- Plugin Setup
require('Comment').setup()

require("color-picker").setup({ -- for changing icons & mappings
	["icons"] = { "■", "🐧" },
	["border"] = "rounded", -- none | single | double | rounded | solid | shadow
	["keymap"] = { -- mapping example:
		["u"] = "<Plug>ColorPickerSlider5Decrease",
		["o"] = "<Plug>ColorPickerSlider5Increase",
	},
	["background_highlight_group"] = "Normal", -- default
	["border_highlight_group"] = "FloatBorder", -- default
  ["text_highlight_group"] = "Normal", --default
})

require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "Neovim",		      -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    --
    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

-- VimTex configuration

vim.cmd([[
filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'
]])


-- catppuccin config

require("catppuccin").setup({
    transparent_background = true, -- disables setting the background color.
})

require("telescope").load_extension("emoji")
require("telescope").load_extension("file_browser")

require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.neorgcmd"] = {},
        ["core.autocommands"] = {},
        ["core.highlights"] = {},
        ["core.mode"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.export"] = {}, -- Loads export module
        ["core.export.markdown"] = {}, -- Loads export markdown module
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}

require("headlines").setup()

-- Execute commands on startup
vim.cmd('colorscheme catppuccin-frappe')
vim.cmd([[hi FloatBorder guibg=NONE]])

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFocus<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-k>', ':t-<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', ':t.<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-a>', ':tabprevious<CR>', { noremap = true, silent=true }) 
vim.api.nvim_set_keymap('n', '<A-s>', ':tabnext<CR>', { noremap = true, silent=true }) 
vim.api.nvim_set_keymap('n', '<A-n>', ':tabnew<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-l>', ':noh<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':move -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':move +1<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-x>', '"_dd', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<A-g>', ':set rnu!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-w>', ':-', { noremap = true})
vim.api.nvim_set_keymap('n', '<A-e>', ':+', { noremap = true})

vim.api.nvim_set_keymap('n', '<C-s>', ':w!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':PickColor<CR>', { noremap = true})

-- vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope find_files<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<C-v>', ':Telescope emoji<CR>', { noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', '"*p', { noremap = true})

vim.api.nvim_set_keymap('n', '<A-q>', 'q:', { noremap = true, silent = true})

-- Splits
vim.api.nvim_set_keymap('n', '<A-Left>', '<C+w>h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Right>', '<C+w>l', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Up>', '<C+w>k', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-Down>', '<C+w>j', { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<m<Left>', ':resize -3', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<m<Right>', ':resize +3', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<m<Up>', ':vertical resize -3', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<m<Down>', ':vertical resize +3', { noremap = true, silent = true})

-- Autocommands - setting nowrap on buffer enter
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'set nowrap'
})
