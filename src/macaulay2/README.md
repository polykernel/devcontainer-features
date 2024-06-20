
# Macaulay2 (macaulay2) (macaulay2)

A feature to installs the [Macaulay2](http://macaulay2.com/) CAS into a dev container.

## Example Usage

```json
"features": {
    "ghcr.io/polykernel/devcontainer-features/macaulay2:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select or enter an Macaulay2 version. | string | latest |

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


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/polykernel/devcontainer-features/blob/main/src/macaulay2/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
