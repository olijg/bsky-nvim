local BS = {}

local config = require("bsky-nvim.config")
local post = require('bsky-nvim.post')

function BS.open_posting_window()
  --- TODO!: Open a window that a user can
  --- create posts in and send on <CR>
end

function BS.setup(opts)
  opts = opts or vim.notify("Configuration not setup")
  if opts then
    config.setup(opts)
  end
  vim.api.nvim_create_user_command("BskyPost",
    function(args)
      post.MakePost(args.fargs[1])
    end,
    { nargs = 1 })
end

return BS
