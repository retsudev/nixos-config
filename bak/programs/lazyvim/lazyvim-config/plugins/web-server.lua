return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,

    config = function()
      local server_job = nil
      local port = 5500
      local host = "127.0.0.1"

      local function is_running()
        return server_job ~= nil
          and vim.fn.jobwait({ server_job }, 0)[1] == -1
      end

      local function start_server()
        if is_running() then
          vim.notify(
            "Live server is already running",
            vim.log.levels.WARN
          )
          return
        end

        local root = vim.fn.getcwd()

        server_job = vim.fn.jobstart({
          "live-server",
          "--host",
          host,
          "--port",
          tostring(port),
          root,
        }, {
          on_exit = function()
            server_job = nil
          end,
        })

        if server_job <= 0 then
          server_job = nil
          vim.notify(
            "Failed to start live-server",
            vim.log.levels.ERROR
          )
          return
        end

        vim.notify(
          "Started: http://" .. host .. ":" .. port
          .. "\nRoot: " .. root
        )
      end

      local function stop_server()
        if not is_running() then
          server_job = nil
          vim.notify(
            "Live server is not running",
            vim.log.levels.WARN
          )
          return
        end

        vim.fn.jobstop(server_job)
        server_job = nil

        vim.notify("Live server stopped")
      end

      local function open_browser()
        vim.fn.jobstart({
          "xdg-open",
          "http://" .. host .. ":" .. port,
        }, {
          detach = true,
        })
      end

      vim.api.nvim_create_user_command("WebStart", start_server, {
        desc = "Start live-server",
      })

      vim.api.nvim_create_user_command("WebStop", stop_server, {
        desc = "Stop live-server",
      })

      vim.api.nvim_create_user_command("WebOpen", open_browser, {
        desc = "Open web server in browser",
      })
    end,
  },
}
