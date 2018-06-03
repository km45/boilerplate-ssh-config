# Boilerplate ssh config

## How to use this boilerplate

### Create your project from this boilerplate

1. Edit `function main()` in `generate-keys.sh`.
1. Add ssh config files to `config.d`.

### Use your project

1. Run `generate-keys.sh` and generate keys.

1. Register keys.

1. Copy `config.d` and add below to `~/.ssh/config`.

   ```txt
   Include config.d/*
   ```

   If you cannot use `Include`,
   add `amalgamate-config.sh` result to `~/.ssh/config` instead.

## How to use your project with "Git for Windows"

"Git for Windows" uses not `~/.ssh/config` but `${GitInstalledPath}\etc\ssh\ssh_config`.

So you can use your project with "Git for Windows" by following steps:

1. Generate keys and register them.
1. Copy `config.d` to `${GitInstalledPath}\etc\ssh`.
1. Edit `${GitInstalledPath}\etc\ssh\ssh_config`

Default git installed path is `C:\Program Files\Git`.

```
C:\Program Files\Git\   # git installed path
  |-- etc\ssh\
  |     |-- config.d    # Copy
  |     |-- ssh_config  # Edit
```

### Refer

* https://stackoverflow.com/questions/9513712/git-ssh-client-for-windows-and-wrong-path-for-ssh-config-file.
