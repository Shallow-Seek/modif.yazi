# modif.yazi

A Yazi plugin that displays recently modified files (within the last 5 days). 

## Requirements

- [Yazi](https://github.com/sxyazi/yazi) file manager
- [`fd`](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to `find`

## Installation

1. Install the plugin by running:

```
git clone https://github.com/your-username/modif.yazi.git ~/.config/yazi/plugins/modif.yazi
```

or

```
ya pkg add Shallow-Seek/modif.yazi
```

2. Add the plugin to your Yazi configuration (`keymap.toml`):

```toml
[[manager.prepend_keymap]]
on = [ "b", "m" ]
run = "plugin modif"
desc = "Show recently modified files"
```

## Configuration

To modify the time range:

1. Find the line with `--changed-within`, `5d` in `main.lua`
2. Change `5d` to your preferred time range (e.g., `1d` for 1 day, `1w` for 1 week)
3. Change the option of `fd` to show files and dirs. including hidden ones: `Command("fd"):arg {"-H", "--changed-within", "5d"}`

## Usage

1. In Yazi, press `b` followed by `m` (or your configured keybinding)
2. files modified within the last 5 days will be shown in the search pane.
3. Navigate, operate, and preview the files as you would in any regular directory. And quit the view by press `esc`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Credits
[vcs-files.yazi](https://github.com/yazi-rs/plugins)
