return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
          ensure_installed = { "cpptools" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      {
        "jbyuki/one-small-step-for-vimkind",
        ft = "lua",
      },
      {
        "Weissle/persistent-breakpoints.nvim",
        config = function()
          require("persistent-breakpoints").setup({
            load_breakpoints_event = { "BufReadPost" },
          })
        end,
      },
      {
        "mfussenegger/nvim-dap",
        dependencies = { "nvim-neotest/nvim-nio" }, -- важно для nvim 0.11+
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
      require("dap.ext.vscode").load_launchjs()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
