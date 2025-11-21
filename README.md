# My Dev Container Features

## NeoVim (No install, from binary)

Install NeoVim instantly from pre-built binaries

```json
"features": {
    "ghcr.io/marcosbolanos/devcontainer-features/neovim-prebuilt:1": {
        "version": "stable"
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| Version | Choose `stable`, `nightly` or a version like `v0.11.5` | string | `stable` |

**Advantages** :

- Build instantly, no OS update or installation required
- Guaranteed stable neovim version
- Works on any distro
- Works for any user that can execute software in /bin (usually any user)

**Disadvantages :**

- Needs curl (auto-installs with apt)
- Adds a `nvim` executable to /bin that runs the AppImage installed in /opt with the command `nvim` (I can make this optional in the future)
