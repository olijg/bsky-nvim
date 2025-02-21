# bsky-nvim

A Neovim plugin for posting to Bluesky.

## Features

-   Post text to Bluesky.

## Installation

Using packer.nvim:

```lua
use {
  'olijg/bsky-nvim',
}
```

Using lazy.nvim:

```lua
{
  'olijg/bsky-nvim',
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

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
