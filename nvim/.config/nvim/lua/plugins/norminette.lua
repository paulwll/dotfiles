return {
  {
    "mfussenegger/nvim-lint",

    opts = function(_, opts)
      -- Run linters only after saving a file
      opts.events = { "BufWritePost" }

      -- Run Norminette on C files
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.c = { "norminette" }

      -- Define Norminette as a custom linter
      opts.linters = opts.linters or {}
      opts.linters.norminette = {
        cmd = "norminette",
        args = { "--no-colors" },
        stdin = false,
        append_fname = true,
        stream = "stdout",
        ignore_exitcode = true,

        parser = require("lint.parser").from_pattern(
          "Error:%s+([A-Z0-9_]+)%s+%(line:%s+(%d+),%s+col:%s+(%d+)%):%s+(.+)",
          { "code", "lnum", "col", "message" },
          nil,
          {
            source = "norminette",
            severity = vim.diagnostic.severity.ERROR,
          }
        ),
      }
    end,
  },
}
