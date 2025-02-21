local M = {
  username = "",
  password = vim.env.BSKY_PASSWORD
}

function M.setup(opts)
  M.username = opts.username
  M.password = opts.password or M.password
end

return M
