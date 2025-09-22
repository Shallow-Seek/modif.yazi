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
ya pkg add Shallow-Seek/modif
```

2. Add the plugin to your Yazi keymaps (`keymap.toml`):

```toml
[[manager.prepend_keymap]]
on = [ "b", "m" ]
run = "plugin modif 5d"
desc = "Show files modified in the last 5 days"
```

## Configuration

You can configure the time range for recently modified files by passing an argument to the `plugin` command in your `keymap.toml`. This allows you to have multiple keybindings for different time ranges.

For example:

```toml
[[manager.prepend_keymap]]
on = [ "b", "w" ]
run = "plugin modif 1w"
desc = "Show files modified in the last week"
```

The default time range is `5d` if no argument is provided. 

The arg will be passed as `fd`'s `--changed-within` [option](https://man.archlinux.org/man/extra/fd/fd.1.en#changed-within). It can be specified using units like d (days), week, month, year.

## Usage

1. In Yazi, press `b` followed by `m` (or your configured keybinding)
2. files modified within the last 5 days will be shown in the search pane.
3. Navigate, operate, and preview the files as you would in any regular directory. And quit the view by press `esc`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Credits
[vcs-files.yazi](https://github.com/yazi-rs/plugins)
