return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.configurations.c = {
        {
          name = "Launch current file",
          type = "codelldb",
          request = "launch",
          program = function()
            local dir = vim.fn.expand("%:p:h")
            local name = vim.fn.expand("%:t:r")
            return dir .. "/" .. name
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.cpp = dap.configurations.c
    end,
  },
}
