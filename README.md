# 🕊 ~ diovim

No-nonsense nearly-default Neovim config with barely-standard bindings.

Built on [AstroNvim v6](https://astronvim.com).\
Previously LazyVim. Previously Helix. The cycle continues.

## Installation

Back up your current config:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Clone and start:

```sh
git clone https://github.com/thedioxider/diovim ~/.config/nvim
nvim
```

Lazy.nvim will install all plugins on first launch.

## Colorscheme

Custom colorscheme (`diovim`) — [tokyonight](https://github.com/folke/tokyonight.nvim) engine with [poimandres](https://github.com/olivercederborg/poimandres.nvim) palette.

## Custom Keybinds

### Buffers

| Key               | Action                 |
| ----------------- | ---------------------- |
| `Alt+h` / `Alt+l` | Previous / next buffer |
| `Alt+c`           | Close buffer           |

### Clipboard

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `y` / `p` / `d`   | Internal registers (not system) |
| `Alt+y` / `Alt+p` | System clipboard yank / paste   |
| `Alt+a`           | Select all                      |

### Navigation

| Key                         | Action                      |
| --------------------------- | --------------------------- |
| `gh` / `gl`                 | Beginning / end of line     |
| `s`                         | Flash jump (label-based)    |
| `S`                         | Flash treesitter select     |
| `<Leader>o`                 | Open Oil file explorer      |
| `<Leader>\\` / `<Leader>\|` | Horizontal / vertical split |

### Repeat keys (swapped)

| Key | Action                           |
| --- | -------------------------------- |
| `;` | Repeat last edit (default `.`)   |
| `.` | Repeat f/t forward (default `;`) |
| `,` | Repeat f/t backward              |

### Multicursor (`\` = local leader)

| Key              | Action                                |
| ---------------- | ------------------------------------- |
| `Up` / `Down`    | Add cursor above / below              |
| `\n` / `\N`      | Add cursor at next / prev match       |
| `\s` / `\S`      | Skip next / prev match                |
| `Ctrl+click`     | Add cursor with mouse                 |
| `Ctrl+q`         | Toggle cursor on/off                  |
| `Left` / `Right` | Switch main cursor (multicursor only) |
| `\x`             | Delete main cursor (multicursor only) |
| `Esc`            | Clear all cursors                     |

### Search & Replace

| Key                 | Action                             |
| ------------------- | ---------------------------------- |
| `<Leader>ss`        | Search/replace in workspace        |
| `<Leader>se`        | Search/replace in current filetype |
| `<Leader>sf`        | Search/replace in current file     |
| `<Leader>sw`        | Replace word under cursor          |
| Visual `<Leader>s`  | Replace selection                  |
| `gS` (neo-tree/oil) | Search/replace in directory        |

### Formatting

| Key             | Action                        |
| --------------- | ----------------------------- |
| `<Leader>lf`    | Format current buffer         |
| `<Leader>uf`    | Toggle autoformat (buffer)    |
| `<Leader>uF`    | Toggle autoformat (global)    |
| `gF` (neo-tree) | Format all files in directory |
