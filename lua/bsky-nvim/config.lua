local M = {
  username = "",
  password = vim.env.BSKY_PASSWORD,
  baseUrl = "https://bsky.social/"
}

function M.setup(opts)
  M.username = opts.username
  M.password = opts.password or M.password
end

return M
