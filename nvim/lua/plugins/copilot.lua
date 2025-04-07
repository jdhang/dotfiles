return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = false,
        auto_trigger = false,
        hide_during_completion = false,
        debounce = 25,
        keymap = {
          accept = false,
          accept_word = false,
          accept_line = "<Tab>",
          next = false,
          prev = false,
          dismiss = false,
        },
      },
      panel = { enabled = false },
      copilot_node_command = "/opt/homebrew/bin/node",   -- Node.js version must be > 20
    })
  end,
}
