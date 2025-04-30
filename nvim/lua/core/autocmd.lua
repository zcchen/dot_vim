-- 打开文件后自动定位上次光标的位置
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        local line = vim.fn.line('\'"')
        if line > 1 and line <= vim.fn.line('$') then
            vim.cmd('normal! g\'"')
        end
    end
})

-- highlight on yank, ref <https://zhuanlan.zhihu.com/p/17683065207>
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("UserHighlightYank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ higroup = "Visual" })
    end,
})
