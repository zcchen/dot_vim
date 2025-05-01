return {
    {
        "drop-stones/im-switch.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true }, -- plenary.nvim is required
        },
        event = "VeryLazy",
        cond = function()
            local os_name = vim.uv.os_uname().sysname
            return (os_name == 'Windows')
        end,
        opts = {
            -- Windows settings
            windows = {
                -- Enable or disable the plugin on Windows/WSL2.
                enabled = true,
            };
            linux = {
                -- Enable or disable the plugin on Linux.
                enabled = false,
                -- The input method set when `default_im_events` is triggered.
                default_im = "keyboard-us",
                -- The command used to get the current input method when `save_im_state_events` is triggered.
                get_im_command = { "fcitx5-remote", "-n" },
                -- The command used to set the input method when `default_im_events` or `restore_im_events` is triggered.
                set_im_command = { "fcitx5-remote", "-s" },
            },
        },
    },
    {
        "h-hg/fcitx.nvim",
        cond = function()
            local os_name = vim.uv.os_uname().sysname
            return (os_name == 'Linux' or os_name == 'Unix')
        end,
    }
}
