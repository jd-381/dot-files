# dot-files

1. Run the setup script

- Installs and updates Homebrew
- Installs common Homebrew packages
- Symlinks config dot files and ssh configs
- Installs Starship preset

```sh
source setup.zsh
```

2. Set up local config files (optional)

- Several configs include `*.local` files
- These are intended for secrets and machine specific settings not tracked in version control
- These are example usages...

`~/.gitconfig.local`

```sh
[user]
	name = John Snow
	email = john.snow@example.com
```

`~/.ssh/config.local`
```sh
# chmod 600 ~/.ssh/config.local
Host github-notes
  HostName github.com
  IdentityFile ~/.ssh/id_example
```

`~/.zshrc.local`
```sh
export AWS_VAULT_BACKEND=file
alias kk="~/workspace/kubectl/kk"
```