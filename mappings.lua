-- Mapping data with "desc" stored directly by vim.keymap.set().
--

local utils = require "astronvim.utils"

local sections = {
  F = { name = "󰍉 Find" },
  p = { name = "󰏖 Packages" },
  l = { name = " LSP" },
  u = { name = " UI" },
  b = { name = "󰓩 Buffers" },
  d = { name = " Debugger" },
  g = { name = " Git" },
  S = { name = "󱂬 Session" },
  t = { name = " Terminal" },
}
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>r"] = { "<cmd>b#<cr>", desc = "Last buffer" },
    ["<leader>f"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<leader>a"] = { "<cmd>A<cr>", desc = "Alternate File" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },

    -- quit

    ["<leader>Q"] = { "<cmd>qa<cr>", desc = "Quit all" },

    -- buffer
    --
    ["<TAB>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
    ["<S-TAB>"] = { "<cmd>bprevious<cr>", desc = "Prev buffer" },

    -- tabs
    ["<leader><tab>"] = { desc = "Tabs" },

    ["<leader><tab>l"] = { "<cmd>tablast<cr>", desc = "Last Tab" },
    ["<leader><tab>f"] = { "<cmd>tabfirst<cr>", desc = "First Tab" },
    ["<leader><tab><tab>"] = { "<cmd>tabnew<cr>", desc = "New Tab" },
    ["<leader><tab>]"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    ["<leader><tab>d"] = { "<cmd>tabclose<cr>", desc = "Close Tab" },
    ["<leader><tab>["] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    -- ["<leader>c"] = { name = "Code" },
    -- ["<leader>cc"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    -- ["<leader>cC"] = { name = "Coverage" },

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    ["<leader>F"] = sections.F,
    ["<leader>f<CR>"] = false,
    ["<leader>f'"] = false,
    ["<leader>fa"] = false,
    ["<leader>fb"] = false,
    ["<leader>fc"] = false,
    ["<leader>fC"] = false,
    ["<leader>ff"] = false,
    ["<leader>fh"] = false,
    ["<leader>fF"] = false,
    ["<leader>fk"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,
    ["<leader>fr"] = false,
    ["<leader>ft"] = false,
    ["<leader>fw"] = false,
    ["<leader>fW"] = false,
    ["<leader>F<CR>"] = { function() require("telescope.builtin").resume() end, desc = "Resume previous search" },
    ["<leader>F'"] = { function() require("telescope.builtin").marks() end, desc = "Find marks" },
    ["<leader>Fa"] = {
      function()
        local cwd = vim.fn.stdpath "config" .. "/.."
        local search_dirs = {}
        for _, dir in ipairs(astronvim.supported_configs) do -- search all supported config locations
          if dir == astronvim.install.home then dir = dir .. "/lua/user" end -- don't search the astronvim core files
          if vim.fn.isdirectory(dir) == 1 then table.insert(search_dirs, dir) end -- add directory to search if exists
        end
        if vim.tbl_isempty(search_dirs) then -- if no config folders found, show warning
          utils.notify("No user configuration files found", "warn")
        else
          if #search_dirs == 1 then cwd = search_dirs[1] end -- if only one directory, focus cwd
          require("telescope.builtin").find_files {
            prompt_title = "Config Files",
            search_dirs = search_dirs,
            cwd = cwd,
          } -- call telescope
        end
      end,
      desc = "Find AstroNvim config files",
    },
    ["<leader>Fb"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<leader>Fc"] = { function() require("telescope.builtin").grep_string() end, desc = "Find for word under cursor" },
    ["<leader>FC"] = { function() require("telescope.builtin").commands() end, desc = "Find commands" },
    ["<leader>Ff"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" },
    ["<leader>FF"] = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["<leader>Fh"] = { function() require("telescope.builtin").help_tags() end, desc = "Find help" },
    ["<leader>Fk"] = { function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
    ["<leader>Fm"] = { function() require("telescope.builtin").man_pages() end, desc = "Find man" },
    -- if is_available "nvim-notify" then
    ["<leader>Fn"] = { function() require("telescope").extensions.notify.notify() end, desc = "Find notifications" },
    -- end,
    ["<leader>Fo"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
    ["<leader>Fr"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },
    ["<leader>Ft"] = {
      function() require("telescope.builtin").colorscheme { enable_preview = true } end,
      desc = "Find the,mes",
    },
    ["<leader>Fw"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["<leader>FW"] = {
      function()
        require("telescope.builtin").live_grep {
          ---@diagnostic disable-next-line: missing-parameter
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Find words in all files",
    },
    ["<leader>gS"] = { "<cmd>Git<cr>", desc = "fugitive" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
