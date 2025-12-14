return {
  "echasnovski/mini.animate",
  version = false,
  config = function()
    require("mini.animate").setup {
      scroll = {
        enable = true,
        timing = require("mini.animate").gen_timing.linear {
          duration = 20, -- adjust speed (lower = faster)
        },
        subscroll = require("mini.animate").gen_subscroll.equal {
          max_output_steps = 60,
        },
      },

      cursor = { enable = true }, -- disable cursor animation (optional)
      resize = { enable = false },
      open = { enable = false },
      close = { enable = false },
    }
  end,
}
