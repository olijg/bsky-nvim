local Curl = require("plenary.curl")
local Path = require("plenary.path")

local Client = {}
Client.static = {}

Client.static.opts = {
  post = { default = Curl.post },
  get = { default = Curl.get },
  encode = { default = vim.json.encode },
  schedule = { default = vim.schedule_wrap },
}

Curl.get("https://archlinux.org/")
