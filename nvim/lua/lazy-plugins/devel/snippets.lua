return {
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "benfowler/telescope-luasnip.nvim",
        },
        --event = "InsertEnter",
        config = function(_, opts)
            local luasnip = require("luasnip")
            luasnip.setup({
                    region_check_events = "CursorHold,InsertLeave",
                    -- those are for removing deleted snippets, also a common problem
                    delete_check_events = "TextChanged,InsertEnter",
                })
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
            --vim.tbl_map(
                --function(t)
                    --require("luasnip.loaders.from_" .. t).lazy_load()
                --end,
                --{ "vscode", "snipmate", "lua" }
            --)
            -- friendly-snippets - enable standardized comments snippets
            luasnip.filetype_extend("typescript", { "tsdoc" })
            luasnip.filetype_extend("javascript", { "jsdoc" })
            luasnip.filetype_extend("lua", { "luadoc" })
            luasnip.filetype_extend("python", { "pydoc" })
            luasnip.filetype_extend("rust", { "rustdoc" })
            luasnip.filetype_extend("cs", { "csharpdoc" })
            luasnip.filetype_extend("java", { "javadoc" })
            luasnip.filetype_extend("c", { "cdoc" })
            luasnip.filetype_extend("cpp", { "cppdoc" })
            luasnip.filetype_extend("php", { "phpdoc" })
            luasnip.filetype_extend("kotlin", { "kdoc" })
            luasnip.filetype_extend("ruby", { "rdoc" })
            luasnip.filetype_extend("sh", { "shelldoc" })
            -- add keymaps
            local r = require("utils.remaps")
            r.map({"i"}, "<Tab>", function()
                    if luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end,
                {silent = true, remap=true}
            )
            r.map({"s"}, "<Tab>", function()
                    luasnip.jump(1)
                end,
                {silent = true, remap=true}
            )
            r.map({"i", "s"}, "<S-Tab>", function()
                    luasnip.jump(-1)
                end,
                {silent = true}
            )
        end,
    },
}
