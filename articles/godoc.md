---
title: "Go（ver1.17.6）で godoc を使うまでの手順"
emoji: "🏞"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["Go", "golang", "godoc"]
published: true
---

# はじめに
Go言語もアップデートを重ねていく中で，例えばパッケージの使い方やそのインストール方法など，段々と扱い方が変化しつつあるようです
実際に私もGoの勉強中に，既存の情報通りに試してもバージョンが違うことからうまくいかない〜〜ということがちょいちょいありましたが，
今回は
>そういえば超々最初の段階でいきなりつまづいたことがあったな〜〜〜

とふと思い出したので，それについての備忘録代わりの記事です．


# やりたいこと
Macに[Go](https://go.dev)（ver1.17.6）をインストールしたのち`godoc`コマンドが使えるようにして，godocでオフラインからドキュメントを閲覧したり，Webサーバーとして起動させてブラウザ上での確認などをしたい


### 環境
- OS: macOS Monterey バージョン12.1（10.13以降なら問題ありません）
- Go: 1.17.6 darwin/amd64


# そもそも GoDoc とは
Goという言語では様々な標準ライブラリやGo製のサードパーティ製パッケージが備わっていますが，それらについてのリファレンスや，また開発をしながらコメントやdocを書く場面があると思いますが，そういったオリジナルのドキュメントですらも全て一つの文書に自動的にまとめてくれる超便利ツールが godoc です
Goを書いている方なら誰しも一度はお世話になったことがあることでしょう．
![godoc](/images/godoc/godoc.png)


# 手順
## 1. Goダウンロード
まず[Go](https://go.dev)の公式ページのからダウンロードをしてインストールまで行います
![Go topページ](/images/godoc/go_top_page.png)
![Go ダウンロード中](/images/godoc/go_download.png)

以下コマンドにて正常にダウンロードできているか確認

```go
$ go version
go version go1.17.6 darwin/amd64
```

ここまでは普段Macをお使いの方はあまり問題ないと思います．


## 2. godocのインストール
### その１
そして，godoc入れるぞ〜！というタイミングで

```go
$ go get golang.org/x/tools/cmd/godoc
```

のコマンドを叩いたところ...

```go
go get: installing executables with 'go get' in module mode is deprecated.
	Use 'go install pkg@version' instead.
	For more information, see https://golang.org/doc/go-get-install-deprecation
	or run 'go help get' or 'go help install'.
```

このようなエラーが出ました
どうやら，
>外部パッケージやツールのインストールに`go get`もう使わないでね〜
代わりに`go install pkg@version`でやってね〜

だそうです

というのも，Go1.17ではモジュール外からコマンドのバイナリを`go get`を使ってインストールした場合，警告が出るようになりました
次のGo 1.18のリリースでは`go get`でコマンドのインストールができなくなるかもしれません...

何はともあれ，エラー文通り

```go
$ go install golang.org/x/tools/cmd/godoc@latest
```
を叩いてみます！


### その２
これで godoc がインストールされたはずなのでコマンドを叩いてみると...

```zsh
$ godoc
zsh: command not found: godoc
```
はにゃ？？
調べるとどうやら，`godoc`の実行バイナリはインストールはされてるものの，そのファイルがインストールされるbinフォルダまでのパスは**Goをインストールしたてほやほやの方は手動で通す必要があるそうです**

そこで，
#### ① まずvimでzshrc[^1]ファイルを開く

```zsh
$ vim ./~zshrc
```


#### ② パスの記述

```zsh
↓(.zshrc内)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
```

#### ③ 保存

```zsh
$ source ~/.zshrc
```


### その３
ここまでやったら，`godoc`コマンドが使えると思います！

```zsh
$ godoc
using module mode; GOMOD=/dev/null    ←これが出てれば概ねOK

```

[localhost:6060](http://localhost:6060)にて以下ページが開けば完了です！
![godoc](/images/godoc/godoc.png)

お疲れさまでした．


# 参考記事
https://qiita.com/ota-yuki/items/8baf92d4a2da8d21cbfb


[^1]: macOS Catalina以降のものは，環境変数などの設定系は”ほぼ全て”ここに入れておけば問題ないです