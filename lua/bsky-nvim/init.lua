local Curl = require("plenary.curl")

local BS = {}

function BS.make_post()
  ---TODO!: Posting functionality goes here
  
end

function BS.setup(opts)
  opts = opts or {}
  vim.api.nvim_create_user_command("BskyPost", BS.make_post, {})
  local keymap = opts.keymap or '<leader>bs'

  vim.keymap.set('n', keymap, BS.open_post_panel, {
    desc = "Post to Bluesky from Nvim",
    silent = true
  })
end

return BS
