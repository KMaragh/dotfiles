# Installation


### Clone the repo to ~/.dotfiles folder

```
cd ~
git clone https://github.com/KMaragh/dotfiles.git .dotfiles
```

### Update submodules

```
cd ~/.dotfiles
./update.sh
```

### Setup the dotfiles directories

```
cd ~/.dotfiles
./setup.sh
```

#Add new submodules manually
```
git submodule add https://github.com/somerepo/submodule.git vim/pack/plugins/somerepo/submodule
```

#Remove submodules manually
```
git submodule deinit vim/pack/plugins/somerepo/submodule
git rm vim/pack/shapeshed/start/somerepo/submodule
rm -Rf .git/modules/vim/pack/somerepo/submodule
git commit

```
