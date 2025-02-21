local config = require("bsky-nvim.config")
local Curl = require("plenary.curl")
local BSAuth = {}

function BSAuth.CreateSession()
  Repo = config.username

  local json = vim.json.encode({
    identifier = config.username,
    password = config.password
  })

  local res = Curl.post(
    config.baseUrl .. "xrpc/com.atproto.server.createSession",
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

return BSAuth
