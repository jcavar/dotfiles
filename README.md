# dotfiles

My personal dotfiles

Make symbolic links to home directory:

```bash
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitignore ~/.gitignore
```

Install plugins:

```bash
git clone git@github.com:joshdick/onedark.vim.git
git clone git@github.com:godlygeek/tabular.git
```


Make symbolic link for easier access to iCloud Directory:

```bash
ln -s /Users/josip04/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
```
