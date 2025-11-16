# dotfiles

My personal dotfiles

Make symbolic links to home directory:

```bash
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore ~/.gitignore
ln -s $PWD/.editrc ~/.editrc
ln -s $PWD/.git_template/ ~/
```

Install plugins:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git@github.com:joshdick/onedark.vim.git
git clone git@github.com:godlygeek/tabular.git
```
Install dependencies:

- brew install fzf
- brew install zsh-syntax-highlighting
- brew install rbenv

Make symbolic link for easier access to iCloud Directory:

```bash
ln -s /Users/josip04/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
```

## OneDark and OneLight for Xcode

https://github.com/MaximBazarov/One-Dark-Xcode

I use font size 17.
