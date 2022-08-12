# dotfiles for osx

## Reqiremnt

- vscode (手動インストール)
- vscodeのcodeコマンド
- Homebrew
- Apple Account
- git, sshの設定
- GitHubにsignin

上記のやり方は必要そうならissueに記載

## Install

You can confirm what files will link by

```
$ make dry-install
```
=> ここでUsingと出たらすでにファイルがある。上書きするようにはしてないので 消す or リンクしないことのどちらかを選択。


wet run  
installといいつつまるっと全部インストールするわけではなく、シンボリックリンクを作るだけ。


```
$ make install
```



いろいろインストール

```
$ brew bundle
$ rbenv install 2.7.2
$ rbenv global 2.7.2
$ bundle install
```

VSCodeの拡張機能のインストール

```
$ make install-vscode-ext
```

VSCodeの追加の設定  
vscodeの settings.json には環境変数を動的に追加することが 2022/8時点ではできない。  
そのため以下のように設定を追加する。  

```.js
{
  "solargraph.useBundler": false,
  "solargraph.commandPath": "/Users/{アカウント名}/.rbenv/shims/solargraph"
}
```

solargraph.commandPathには以下で出たパスをいれる。

```
$ which solargraph
```

この設定を追加するのは選択肢以下の2つあるがどちらでもよい。

- dotfilesの vscode/settings.json
- 作業リポジトリの.vscode/settings.json

後者の場合には Command + Shift + P から 入力欄に settings って打てば  
Open Workspace Settings (JSON)  
っていう選択肢がでるのでそれでファイルは生成する。

個人的にはdotfilesに差分出したくないので後者のほうが好み

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

■ zsh compinitでエラー

```
zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]?
```
が出た場合

この記事
https://qiita.com/ayihis@github/items/88f627b2566d6341a741


■ `brew bundle` 時にmasのインストール失敗

手動でやる

例

```
$ mas install 1518036000
```
