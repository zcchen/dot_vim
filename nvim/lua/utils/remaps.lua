local X = {}

function X.map(modes, lhs, rhs, opts)
    local options = {
        remap = false,
    }
    if opts then
        options = vim.tbl_deep_extend("force", options, opts)
    end
    vim.keymap.set(modes, lhs, rhs, options)
end

return X
