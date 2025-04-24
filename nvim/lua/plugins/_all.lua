local M = {}
M.lazy = {
    spec = {},
    install = {}
}

local plugin_modnames = {
    "plugins.ui",
    "plugins.files",
}

local loaded = {}
for _, p in ipairs(plugin_modnames) do
    if not vim.list_contains(loaded, p) then
        for k, v in pairs(M.lazy) do
            v = vim.list_extend(v, require(p).lazy[k])
        end
        loaded = vim.list_extend(loaded, {p})
    end
end

return M
