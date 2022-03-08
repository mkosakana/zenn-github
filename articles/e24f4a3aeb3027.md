---
title: "空構造体 の表し方"
emoji: "🪁"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["Go", "golang"]
published: true
---

# はじめに結論
**空の構造体（struct）は`struct{}`と表します**
`interface{}`みたいなものですね

空構造体は
- 空の構造体は**メモリサイズが 0である**
- 空の構造体は**属性（フィールド）** を持たない
- 空の構造体は**同じアドレス**を示す

などといった特性を持ちます．


# まず，構造体（struct）とは？
`「type [定義する名前] struct」`のように使用します
```go
// 「Person」という名前の構造体（struct）
// この場合、NameとAgeという「フィールド」を持っています
type Person strcut {
  Name string
  Age int
}
```

「フィールド」はpytonなどで使われる`class`でいうところの，コンストラクタのようなものです

そして、この`フィールドを何も持たない`，つまり”空”であるということから
```go
struct{}
```

この書き方で表せるのですね〜！


# 使ってみた
```go
package main

import "fmt"

type (
	numbers  struct{}
	pointers struct{}
)

func (numbers) count() int {
	return 10
}

func (p pointers) address() string {
	return fmt.Sprintf("%p \n", &p)
}

func main() {
	var (
		numberFirst = numbers{}
		p1 = pointers{}
		p2 = pointers{}
		p3 = pointers{}
	)

	// numberFirst から addr() は呼べない
	// p1~3 から count() は呼べない
	fmt.Println(numberFirst.count())
	fmt.Println(p1.address(), p2.address(), p3.address())
}

// 出力
10
0x596c18
0x596c18
0x596c18
```

> 空構造体は
> - 空の構造体は**メモリサイズが 0である**
> - 空の構造体は**属性**を持たない
> - 空の構造体は**同じアドレス**を示す

空構造体は，何度生成しても`同じアドレス`を示すので，実体（`numberFirst`, `p1`, `p2`, `p3`）は同じものということになります
しかしながらGoでは，**型の別名を付与すると完全に別の型として扱われる**ため，同じアドレスを示すものでも別名さえ付けてしまえば、上記のようにそれぞれに個別にメソッドが定義できます

また、`メモリを使わない`ため，例えば，終了管理のみ行うチャネルを用意する際に

 ```go
type nothing struct{}

done := make(chan nothing)

go func() {
    defer close(done)
}()
```

などとすることができます

何かと使えそうですね．