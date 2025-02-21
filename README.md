# bsky-nvim

A Neovim plugin for posting to Bluesky.

## Features

-   Post text to Bluesky.

## Installation

Using lazy.nvim:

```lua
{
  'olijg/bsky-nvim',
  dependencies = { 'nvim-lua/plenary.nvim' }
}
```

## Usage

```lua
:BlueskyPost Your post text here
```

Or, in Lua:

```lua
require('bsky-nvim.post').MakePost("Your post text here")
```

## Configuration

To configure, create a `bluesky.lua` file or configure directly:

```lua
require('bsky-nvim').setup({
  -- Your configuration options here
    username = {YOUR-BSKY-HANDLE},
    -- Optional: It is highly recommended to leave this empty
    -- and instead add the environment variable $BSKY_PASSWORD
    -- to your .bashrc or equivalent
    password = {YOUR-BSKY-PASSWORD}
})
```

## Roadmap

- Open an nvim window to compose posts
- See a feed from an nvim window
- Interact with posts in your feed

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
