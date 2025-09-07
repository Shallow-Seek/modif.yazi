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

The time range is currently hardcoded to 5 days. To modify this:

1. Edit `main.lua`
2. Find the line with `--changed-within`, `5d`
3. Change `5d` to your preferred time range (e.g., `1d` for 1 day, `1w` for 1 week)
4. Change the option of `fd` to show files and dirs. including hidden ones: `Command("fd"):arg {"-H", "--changed-within", "5d"}`

## Usage

1. In Yazi, press `b` followed by `m` (or your configured keybinding)
2. A new tab will open showing files modified within the last 5 days
3. Navigate the files as you would in any regular directory

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Credits
[vcs-files.yazi](https://github.com/yazi-rs/plugins)
