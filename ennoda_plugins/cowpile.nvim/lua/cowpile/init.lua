local M = {}

local function get_attr ()
    local sln_path = vim.fn.getcwd() .. "/.sln.lua"

    -- Check if file exists
    local file = io.open(sln_path, "r")
    if not file then
        vim.notify("Error: .sln.lua file not found in current directory", vim.log.levels.ERROR)
        return
    end
    file:close()

    -- Try loading the file as a Lua chunk
    local chunk, err = loadfile(sln_path)
    if not chunk then
        vim.notify("Error loading .sln.lua: " .. err, vim.log.levels.ERROR)
        return
    end

    local success, sln = pcall(chunk)
    if not success then
        vim.notify("Error executing .sln.lua: " .. result, vim.log.levels.ERROR)
    end




    return { gen = sln.gen, bld = sln.bld, exe = sln.exe }
end

M.setup = function(opts)
    vim.api.nvim_create_user_command("CowpileAndRebuild", function()
        local res = get_attr()
        local gen, bld, exe = res.gen, res.bld, res.exe

        if not gen then
            vim.notify("Error \"gen\" key not found", vim.log.levels.ERROR)
            return
        end

        if not bld then
            vim.notify("Error \"bld\" key not found", vim.log.levels.ERROR)
            return
        end

        if not exe then
            vim.notify("Error \"exe\" key not found", vim.log.levels.ERROR)
            return
        end

        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_command('split')
        vim.api.nvim_win_set_buf(0, bufnr)

        vim.fn.termopen(gen .. " && " .. bld .. " && " .. exe)
    end, {})

    vim.api.nvim_create_user_command("CowpileAndBuild", function()
        local res = get_attr()
        local gen, bld, exe = res.gen, res.bld, res.exe

        if not bld then
            vim.notify("Error \"bld\" key not found", vim.log.levels.ERROR)
            return
        end

        if not exe then
            vim.notify("Error \"exe\" key not found", vim.log.levels.ERROR)
            return
        end

        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_command('split')
        vim.api.nvim_win_set_buf(0, bufnr)

        vim.fn.termopen(bld .. " && " .. exe)
    end, {})

    vim.api.nvim_create_user_command("CowpileAndRun", function()
        local res = get_attr()
        local gen, bld, exe = res.gen, res.bld, res.exe

        if not exe then
            vim.notify("Error \"exe\" key not found", vim.log.levels.ERROR)
            return
        end

        local bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_command('split')
        vim.api.nvim_win_set_buf(0, bufnr)

        vim.fn.termopen(exe)
    end, {})
end


return M
