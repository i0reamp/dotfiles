# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## What's included

- **sway** — tiling Wayland compositor (`--to-code` bindings for multi-layout support)
- **waybar** — status bar with proxy toggle
- **alacritty** — terminal (Terminus font, Russian layout copy/paste)
- **nvim** — LazyVim config
- **fish** — shell config
- **sing-box** — VLESS proxy client (systemd user service on port 10488)
- **wallpaper** — auto-change wallpaper every 30 min via systemd timer

## Deploy on a new machine

### 1. Install chezmoi and apply dotfiles

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply i0reamp
```

### 2. Create chezmoi config with credentials

The sing-box and sway configs use chezmoi templates. Create `~/.config/chezmoi/chezmoi.toml`:

```toml
[data]
    is_laptop = true  # false for desktop

    # sing-box VLESS proxy
    singbox_server = "server.example.com"
    singbox_port = 443
    singbox_sni = "example.com"
    singbox_uuid = "your-uuid-here"
    singbox_public_key = "your-public-key"
    singbox_short_id = "your-short-id"
    singbox_fingerprint = "chrome"
```

Then re-apply:

```sh
chezmoi apply
```

### 3. Enable services

```sh
systemctl --user daemon-reload
systemctl --user enable --now sing-box.service
systemctl --user enable --now wallpaper.timer
```

### 4. Verify proxy

```sh
curl -x http://127.0.0.1:10488 https://ifconfig.me
```

## Updating

Pull latest changes and apply:

```sh
chezmoi update
```
