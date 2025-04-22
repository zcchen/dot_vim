vim.api.nvim_create_autocmd('BufReadPost', {    -- 打开文件后自动定位上次光标的位置
    pattern = '*',
    callback = function()
        local line = vim.fn.line('\'"')
        if line > 1 and line <= vim.fn.line('$') then
            vim.cmd('normal! g\'"')
        end
    end
})

