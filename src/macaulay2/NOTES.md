## OS Support

This feature currently only works on recent versions of Debian or Ubuntu with the `apt` package manager installed.

## Options

You can select a specific Macaulay2 version to install. For example, the following installs the latest Macaulay2 release:

```json
"features": {
  "ghcr.io/polykernel/devcontainer-features/macaulay2:1": {
    "version": "latest"
  }
}
```

> [!NOTE]
> Currently only the latest Macaulay2 release can be installed.
