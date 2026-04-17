# Feathers and Flame

This setup combines the snappiness and good hardware support of CachyOS with the gorgeous minimalism of Niri and Noctalia Shell.
It's completely modular; you can either breeze through the install menu, pressing 'Yes' to get a cohesive and well-configured system to start off with, or you can pick through selectively to avoid your particular raisins.

## Some highlights

- Niri, Noctalia, CachyOS (obv)
- Comprehensive theming setup; colours chosen dynamically from wallpaper
- Wallpaper keybinds for favourite groups: get a random wallpaper from any favourite category
- `cbonsai` screensaver
- Night light with `wlsunset`
- Fine-tuned window rules and shell configuration; custom hot-swap rules
- LUKS-encrypted auto-login
- Refined LazyVim out of the box
- Advanced power-management with `tlp`
- Performance optimisations with `gamemode`
- Privacy-focused browser setup with Tor and Mullvad browsers
- Hide supurfluous `.desktop` entries to keep the launcher clean
- File-sharing binds for `localsend`
- Improved Nautilus integration for LazyVim and Alacritty
- Preconfigured Virt-Manager with QEMU
- Pre-set mimetypes
- Easy-installation of suggested programs
- Limine snapshots

## Installation

Installation takes the form of a single `curl` command in an appropriate fresh CachyOS install.

### of CachyOS (Preliminary)

In the CachyOS installer, make sure to encrypt your drive with LUKS, choose Limine as your bootloader, Niri as your window compositor, and use the same password for encryption as your account. You can uncheck `Firefox` from the pre-installed packages.

### of Feathers and Flame

Once you've booted into your basic installation, press `Mod+Return` to open a terminal and run:
`curl -fsSL https://serpentdagger.com/feathers-and-flame/install | bash`.
Follow the prompts to arrive at a beautiful and functional system!
