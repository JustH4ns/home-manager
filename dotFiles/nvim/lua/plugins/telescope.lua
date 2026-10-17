return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    -- opts as a function so telescope.actions is required only after lazy.nvim
    -- has installed and loaded the plugin
    opts = function()
        local actions = require("telescope.actions")
        return {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
        }
    end,
}
