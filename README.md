# Initial setup

## Prerequisites

### Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Zsh
```bash
brew install zsh
chsh -s /usr/local/bin/zsh
```

### Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# plugins

## syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlightin

## autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

```

### PowerLevel10K

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Local configuration

```bash
mkdir -p $HOME/.config/scripts
touch $HOME/.config/scripts/custom.sh
```

## Tools

```bash
# bat
brew install bat

# tmux
brew install tmux

# ag
brew install the_silver_searcher

# fzf
brew install fzf
## To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install


```

### nvim

```bash
brew install neovim

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

 # Open nvim and then run command :PackerInstall
```

## Setup

```bash
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

From:

<https://www.atlassian.com/git/tutorials/dotfiles>
