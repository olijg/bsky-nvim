local Curl = require("plenary.curl")

local BS = {}

local config = require("bsky-nvim.config")

local baseUrl = "https://bsky.social/"

function BS.CreateSession()
  Repo = config.username
  local json = vim.json.encode({
      identifier = config.username,
      password = config.password
    })
  local res = Curl.post(
    baseUrl .. "xrpc/com.atproto.server.createSession",
    {
      headers = { content_type = "application/json" },
      body = json
    }
  )
  if res.status == 200 then
    return vim.fn.json_decode(res.body).accessJwt
  else
    print("An error occurred during verification\n")
    print(res.body)
    return nil
  end
end

function BS.MakePost(opts)
  local accessToken = BS.CreateSession()

  local json = vim.json.encode({
    repo = Repo,
    collection = "app.bsky.feed.post",
    record = {
      text = opts,
      createdAt = os.date("%Y-%m-%dT%H:%M:%SZ")
    }
  })
  local res = Curl.post(
    baseUrl .. "xrpc/com.atproto.repo.createRecord",
    { headers = {
      content_type = "application/json",
      ["Authorization"] = "Bearer " .. accessToken,
      },
      body = json
    }
  )

  if res.status == 200 then
    print("Post sent!")
  else
    print("Could not create post...\n")
    print(res.body)
  end
end

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
      BS.MakePost(args.fargs[1])
    end,
    { nargs = 1 })

  local keymap = opts.keymap or '<leader>bs'

  vim.keymap.set('n', keymap, BS.MakePost, {
    desc = "Post to Bluesky from Nvim",
    silent = true
  })
end

return BS
