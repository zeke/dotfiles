# zeke/dotfiles

> My dotfiles repository. There are many like it, but this one is mine.

# symlinks

```sh
cd ~
ln -s ~/git/zeke/dotfiles/.zshrc .zshrc
ln -s ~/git/zeke/dotfiles/.gitignore_global .gitignore_global
```

## homebrew

https://brew.sh

See [Brewfile](Brewfile)

At the tail end of the homebrew installation, circa September 2021:

```
- Run these two commands in your terminal to add Homebrew to your PATH:
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/z/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
```

## node / npm

Download LTS .pkg installer from https://nodejs.org

## global node modules

```
npm i -g trymodule npe json shrug vmd ghwd
```

## terminal / shell / zsh

- `pure` is already installed from the Brewfile
- Snazzy theme for Terminal.app: https://github.com/sindresorhus/terminal-snazzy
- Pretty, minimal and fast ZSH prompt: https://github.com/sindresorhus/pure

## npm

```sh
npm config set init.author.name "Zeke Sikelianos"
npm config set init.author.email zeke@sikelianos.com
npm config set init.author.url http://zeke.sikelianos.com
npm config set init.license MIT
```

## git

```sh
git config --global core.excludesfile ~/.gitignore_global
git config --global user.name "Zeke Sikelianos"
git config --global user.email zeke@sikelianos.com
git config --global hub.protocol https
```

## vscode

```sh
# Back up existing settings
cp ~/Library/Application\ Support/Code/User/*.json ~/git/zeke/dotfiles/vscode/

# Symlink to dotfiles
ln -s ~/git/zeke/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/git/zeke/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```