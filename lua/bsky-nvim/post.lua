local config = require('bsky-nvim.config')
local Curl = require("plenary.curl")
local auth = require('bsky-nvim.auth')
local BSPost = {}

function BSPost.MakePost(postText)
  local accessToken = auth.CreateSession()

  local json = vim.json.encode({
    repo = Repo,
    collection = "app.bsky.feed.post",
    record = {
      text = postText,
      createdAt = os.date("%Y-%m-%dT%H:%M:%SZ")
    }
  })
  local res = Curl.post(
    config.baseUrl .. "xrpc/com.atproto.repo.createRecord",
    {
      headers = {
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

return BSPost
