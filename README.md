![GitHub](https://img.shields.io/github/license/ptavares/zsh-kubectx)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
![Release](https://img.shields.io/badge/Release_version-0.1.0-blue)

# zsh-kubectx

zsh plugin for installing and loading [kubectx](https://github.com/ahmetb/kubectx.git)
>Inpired by [zsh-pyenv](https://github.com/mattberther/zsh-pyenv)

## Table of content

_This documentation section is generated automatically_

<!--TOC-->

- [zsh-kubectx](#zsh-kubectx)
  - [Table of content](#table-of-content)
  - [Usage](#usage)
  - [Updating kubectx](#updating-kubectx)
  - [License](#license)

<!--TOC-->

## Usage

Once the plugin installed, `kubectx` will be available

- Using [Antigen](https://github.com/zsh-users/antigen)

Bundle `zsh-kubectx` in your `.zshrc`

```shell
antigen bundle ptavares/zsh-kubectx
```

- Using [zplug](https://github.com/b4b4r07/zplug)

Load `zsh-kubectx` as a plugin in your `.zshrc`

```shell
zplug "ptavares/zsh-kubectx"
```

- Using [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell
zget load ptavares/zsh-kubectx
```

- As an [Oh My ZSH!](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone `zsh-kubectx` into your custom plugins repo and load as a plugin in your `.zshrc`

```shell
git clone https://github.com/ptavares/zsh-kubectx.git ~/.oh-my-zsh/custom/plugins/zsh-kubectx
```

```shell
plugins+=(zsh-kubectx)
```

Keep in mind that plugins need to be added before `oh-my-zsh.sh` is sourced.

- Manually

Clone this repository somewhere (`~/.zsh-kubectx` for example) and source it in your `.zshrc`

```shell
git clone https://github.com/ptavares/zsh-kubectx ~/.zsh-kubectx
```

```shell
source ~/.zsh-kubectx/zsh-kubectx.plugin.zsh
```

## Updating kubectx

The plugin comes with a zsh function to update [kubectx](https://github.com/ahmetb/kubectx.git) manually

```shell
# From zsh shell
update_zsh_kubectx
```

## License

[MIT](LICENCE)
