-- TUI
require("dapui").setup()

-- Python
require("dap-python").setup("uv") -- find python/venv via uv

-- Define signs for DAP
local debug_icons = require("icons").debug
vim.fn.sign_define("DapBreakpoint", {
  text = debug_icons.breakpoint,
  texthl = "DapBreakpoint",
  linehl = "DapBreakpointLine",
  numhl = "DapBreakpointNum",
})
vim.fn.sign_define("DapBreakpointCondition", {
  text = debug_icons.condition,
  texthl = "DapBreakpointCondition",
  linehl = "DapBreakpointConditionLine",
  numhl = "DapBreakpointConditionNum",
})
vim.fn.sign_define("DapBreakpointRejected", {
  text = debug_icons.rejected,
  texthl = "DapBreakpointRejected",
  linehl = "DapBreakpointRejectedLine",
  numhl = "DapBreakpointRejectedNum",
})
vim.fn.sign_define("DapLogPoint", {
  text = debug_icons.log,
  texthl = "DapLogPoint",
  linehl = "DapLogPointLine",
  numhl = "DapLogPointNum",
})
vim.fn.sign_define("DapStopped", {
  text = debug_icons.stopped,
  texthl = "DapStopped",
  linehl = "DapStoppedLine",
  numhl = "DapStoppedNum",
})
