---
title: "JavaScript（TypeScript）文字列操作まとめ"
emoji: "🚞"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["TypeScript", "JavaScript", "コーディングテスト", "プログラミング問題"]
published: true
---

JavaScript（及びTypeScript）の，**文字列操作に関する”技”** をまとめました
日頃の開発やコーディングテスト対策などにも役立てていただけたら幸いです．


# テンプレートリテラル
#### 文字列への変数埋め込みにはこれを使用します

```javascript
// 通常の変数同士の連結はこちら
let a = 'Java';
let b = 'Script';
let result = a + b ;
console.log(result); 

// 出力
'JavaScript'


// 文字列への変数埋め込み
let number = 10;
let text = `りんごを${number}個とみかんを${number - 5}個ください`;  // ${}内に計算式をいれてもOK
console.log(text);

// 出力
'りんごを10個とみかんを5個ください'
```

## テンプレートリテラルで改行

```javascript
const text = `Java
Script
    しか勝たん`;

console.log(text);

// 出力
            Java
Script
    しか勝たん
```
代入した**そのままの形**が保持されます

## テンプレートリテラル内のエスケープ

```javascript
const text = `Java\\Script`;
console.log(text); 

// 出力
Java\Script
```


# 配列の文字列を連結
## `join`

```javascript
const array = [4, 3, 2, 1];

// つなぎ目の文字を指定できる
let strings1 = array.join('');
console.log(strings1);

let strings2 = array.join('---');
console.log(strings2);

// 出力
"4321"
"4--3--2--1"
```

#### ※変数同士の連結はこちら（文字列と変数の連結は`テンプレートリテラル`を使用）

```javascript
let a = 'Java';
let b = 'Script';
let result = a + b ;
console.log(result); 

// 出力
JavaScript
```


# 文字列の切り出し
## 対象の文字列.`slice( 開始位置, 終了位置 )`;

```javascript
const text = '本日も、よろしくお願いします';

// インデックスが「4」から最後までの文字を切り出し
let result = text.slice(4);
console.log(result);

// インデックスが「0」から「3」の前までの文字を切り出し
let result2 = text.slice(0, 3);
console.log(result2); 

// 出力
よろしくお願いします
本日も


// 開始位置を後ろからの桁数で数えて切り出し（右端のみ切り出せる）
let result3 = text.slice(-7, 5);
console.log(result3); 

// 出力
くお願いし
```

## 対象の文字列.`substr( 開始位置, 切り出す文字数 )`;

```javascript
const text = '本日も、よろしくお願いします';

let result = text.substr(0, 3);
console.log(result); 

// 出力
本日も


// 開始位置を後ろから数えて切り出し
let result2 = text.substr(-7, 3);
console.log(result2);

// 出力
くお願
```

## 対象の文字列.`substring( 開始位置, 終了位置 )`;

```javascript
const text = '本日も、よろしくお願いします';

// インデックスが「0」から「3」の前までの文字を切り出し
let result = text.substring(0, 3);
console.log(result); 

// 出力
本日も


// 開始位置 > 終了位置 のとき -> 開始位置:インデックス「8」, 終了位置:インデックス「4」 
// 終了位置と開始位置が逆になる
let result2 = text.substring(8, 4);
console.log(result2); 

// 出力
よろしく  // インデックスが「4」から「8」の前まで


// 開始位置から文字列の先頭まで -> 開始位置:8文字目, 終了位置:文字列の先頭
let result3 = text.substring(8, -1);
console.log(result3);

// 出力 
本日も、よろしく
```


# 分割
## 対象の文字列.`split( 区切り文字 )`;

```javascript
let years = '2018, 2019, 2020';
// 「,」 カンマ区切りで分割して配列に格納
var result = years.split(','); 

console.log(result); 

// 出力
["2018", " 2019", " 2020"]
```


# 置換・削除
## 対象の文字列.`replace( 置換前の文字列, 置換後の文字列 )`;

```javascript
let text = '夕食はラーメンとカレーです';
let result = text.replace('カレー', '餃子');
console.log(result); 

// 出力
夕食はラーメンと餃子です


let text = '夕食はラーメンとカレーです';
let result2 = text.replace('とカレー', '');
console.log(result2); 

// 出力
夕食はラーメンです
```


# 検索
## 対象の文字列.`indexOf( 検索したい文字列 )`; （※前方一致）

```javascript
let greeting = 'おはようございまーす';
let result1 = greeting.indexOf('ございまー');
let result2 = greeting.indexOf('!');

console.log(result1); 
console.log(result2); 

// 出力
4
-1
```
**検索したい文字列を含む:    `インデックスを返す`**
**検索したい文字列を含まない: `-1 を返す`**

## 対象の文字列.`lastIndexOf( 検索したい文字列 )`; （※後方一致）

```javascript
let greeting = 'おはようございまーす';
let result1 = str.lastIndexOf('ございまー');
let result2 = str.lastIndexOf('!');

console.log(result1);
console.log(result2); 

// 出力
4
-1
```
**検索したい文字列を含む:    `（前から数えた）インデックスを返す`**
**検索したい文字列を含まない: `-1 を返す`**


# トリム
## 対象の文字列の前後にある空白を削除する
#### 対象の文字列.`trim()`;

```javascript
let greeting = '  おはようございまーす　　　   ';
let result = greeting.trim();
console.log(result); 

// 出力
おはようございまーす
```


# 大文字・小文字に変換
## 大文字に変換
#### 対象の文字列.`toUpperCase()`;

```javascript
let str = 'Chrome';
let result = str.toUpperCase();
console.log(result); 

// 出力
CHROME
```

## 小文字に変換
#### 対象の文字列.`toUpperCase()`;

```javascript
let str = 'ZENN';
let result = str.toLowerCase();
console.log(result); 

// 出力
zenn
```


# 型変換
## 文字列を数値にする
### `Number( 文字列 )`;

```javascript
let str = '123';
let result = Number(str);
console.log(result); 

// 出力
123


// typeofで型判定
console.log(typeof result) 

// 出力
number
```

## 数値を文字列にする
### `String( 数値 )`;

```javascript
let num = 123;
let result = String(num);
console.log(result); 

// 出力
'123'


// typeofで型判定
console.log(typeof result) 

// 出力
string
```


# 文字数をカウント
## 対象の文字列.`length`;

```javascript
let str = 'あいうえお';
let result = str.length;
console.log(result); 

// 出力
5
```


# 参考
https://catprogram.hatenablog.com/entry/2013/05/13/231457
