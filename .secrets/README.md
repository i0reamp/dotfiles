# Encrypted backup of ~/.config/chezmoi/chezmoi.toml

Encrypted with age. Public key for verification:
`age1q8eh4dgc3g40t4e6ygjl608jlh9hdrh3485sfhzfm88tztsz0srsq85sge`

## Restore on new machine
```
# 1. Place private key (NOT in this repo!) at:
~/.config/chezmoi/key.txt   # chmod 600

# 2. Decrypt:
age -d -i ~/.config/chezmoi/key.txt -o ~/.config/chezmoi/chezmoi.toml \
    ~/.local/share/chezmoi/.secrets/chezmoi.toml.age

# 3. chezmoi apply
```
