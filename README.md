# check-filename-prefix

A pre-commit hook that ensures added or modified filenames begin with a specified prefix.

## What it does

Checks each file staged for commit and fails the commit if the file's basename (filename only, not path) doesn't start with the required prefix.

## Prerequisites

To use this hook, you need:

- [pre-commit](https://pre-commit.com/) installed
- `bash` shell available
- POSIX-compliant operating system (Linux, macOS, WSL, etc.)

## Setup

Add the hook to the `.pre-commit-config.yaml` file in your project as shown:

```yaml
- repo: https://github.com/dunterov/check-filename-prefix
  rev: v1.0.0
  hooks:
  - id: check-filename-prefix
    args:
    - "--prefix"
    - "my_prefix_"
```

Adjust `--prefix` each filename must start with. This parameter is required.

## Exit codes

- 0: All filenames are valid
- 1: At least one file has an invalid name
- 2: Missing required --prefix argument

## Configuration examples

### Limit checks to files located in a given directory

```yaml
- repo: https://github.com/dunterov/check-filename-prefix
  rev: v1.0.0
  hooks:
  - id: check-filename-prefix
    args:
    - "--prefix"
    - "my_prefix_"
    files: ^my_dir/
```

This configuration scopes pre-commit to files inside my_dir only.

### Configure pre-commit to ignore specific files

```yaml
- repo: https://github.com/dunterov/check-filename-prefix
  rev: v1.0.0
  hooks:
  - id: check-filename-prefix
    args:
    - "--prefix"
    - "my_prefix_"
    exclude: ^my_dir2/myfile$
```

This setting configures pre-commit to exclude `my_dir2/myfile` from being processed by the hook.

See the [official pre-commit documentation](https://pre-commit.com/#regular-expressions) for more details about regular expression suitable for `exclude` and `files`.
