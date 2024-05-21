# dotfiles

My dotfiles, managed by [rcm].

[rcm]: https://github.com/thoughtbot/rcm


## Installation

```shell
git clone https://github.com/rynkowsg/dotfiles ~/src/os/rynkowsg/dotfiles
ln -s ~/src/os/rynkowsg/dotfiles ~/.dotfiles
~/.dotfiles/.internal/install

git -C "${HOME}/.dotfiles" remote set-url origin git@github.com:rynkowsg/dotfiles.git
```

## Usage

### General

To reinstall dotfiles:
```shell
# reinstall
dot-reinstall
# reinstall with asking about approve before making changes
dot-reinstall true
```

To update dotfiles:
```shell
# reinstall
dot-update
```

To sync dotfiles - pull & rebase changes from remote repo and then push if it has anything new:
```shell
# reinstall
dot-sync
```

### rcm specific

[rcm] is a dotfiles (aka RC files) manager. It is a simple tool to manage dotfiles repo,
yet it support complex dotfiles configurations.

```sh
# add hostname specifc file (under host-$HOSTNAME dir)
mkrc -o ~/.rcrc
# equivalent of
mkrc -B "$(hostname)" ~/.rcrc
```

```sh
# add under 'terraform' tag
mkrc -t terraform ~/.terraformrc

# add under 'clj' tag, but link entire directory (instead of single files)
mkrc -t clj -S ~/.clojure
```

**IMPORTANT:**
When you use `mkrc` with `-S` flag, most probably you need to list the directory in `rcrc` file under `SYMLINK_DIRS`.
Without it, `rcm` will not apply a symlink for entire directory during installation but will symlink files it contains.

More about rcm:
- https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos
- https://thoughtbot.github.io/rcm/rcm.7.html
- https://thoughtbot.github.io/rcm/rcrc.5.html
