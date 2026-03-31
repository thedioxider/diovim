# 🕊 ~ diovim

No-nonsense nearly-default Neovim config with barely-standard bindings.

Built on [AstroNvim v6](https://astronvim.com).\
Previously LazyVim. Previously Helix. The cycle continues.

## Custom Keybinds

### Buffers
| Key | Action |
|-----|--------|
| `Alt+h` / `Alt+l` | Previous / next buffer |
| `Alt+c` | Close buffer |

### Clipboard
| Key | Action |
|-----|--------|
| `y` / `p` / `d` | Internal registers (not system) |
| `Alt+y` / `Alt+p` | System clipboard yank / paste |
| `Alt+a` | Select all |

### Multicursor (`,` = local leader)
| Key | Action |
|-----|--------|
| `Up` / `Down` | Add cursor above / below |
| `,n` / `,N` | Add cursor at next / prev match |
| `,s` / `,S` | Skip next / prev match |
| `Ctrl+click` | Add cursor with mouse |
| `Ctrl+q` | Toggle cursor on/off |
| `Left` / `Right` | Switch main cursor (multicursor only) |
| `,x` | Delete main cursor (multicursor only) |
| `Esc` | Clear all cursors |
