# dotfiles for osx

## Reqiremnt

- vscode (手動インストール)
- vscodeのcodeコマンド
- Homebrew
- Apple Account
- git, sshの設定
- GitHubにsignin

## Install

You can confirm what files will link by

```
$ make dry-install
```

wet run

```
$ make install
```


```
$ brew bundle
```

VSCodeの拡張機能のインストール

```
$ make install-vscode-ext
```

## Contents

- zsh
- vscode
 - settings
 - extentions

## Directory
- home -> $HOME
- other -> locations.tsv

## oneshot
files that don't link.

## Unlink

manual.

```
# confirm link
$ ls -l ~/.zshrc

# unlink
$ unlink ~/.zshrc
```

## 育て方
https://qiita.com/reireias/items/b33b5c824a56dc89e1f7

## トラブルシューティング

```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```
が出た場合

この記事
https://qiita.com/ayihis@github/items/88f627b2566d6341a741



