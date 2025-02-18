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
:BlueskyPost "Your post text here"
```

Or, in Lua:

```lua
require('bluesky').post("Your post text here")
```

## Configuration

To configure, create a `bluesky.lua` file or configure directly:

```lua
require('bsky-nvim').setup({
  -- Your configuration options here
})
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.
```
