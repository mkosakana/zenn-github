---
title: "JavaScript（TypeScript）配列操作まとめ ~基礎編~"
emoji: "🚸"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["TypeScript", "JavaScript", "コーディングテスト", "プログラミング問題"]
published: true
---

JavaScript（及びTypeScript）の，**配列操作に関する”技”** をまとめました
日頃の開発やコーディングテスト対策などにも役立てていただけたら幸いです．


# 要素数取得
## **`length`**

```javascript
// 配列
const array = [40, 30, 20, 10];

// 要素数取得
console.log(array.length);

// 出力
4
```


# 配列内の要素の存在確認
## **`includes`**

```javascript
const array = [4, 3, 2, 1];

console.log(array.includes(1));
console.log(array.includes(500));

// 出力
true
false
```


# 要素の位置（インデックス）確認 & 存在確認
## **`indexOf`**

```javascript
const array = [4, 3, 2, 1];

console.log(array.indexOf(1));
console.log(array.indexOf(500));
// 「4」という要素のインデックスから，2個後ろのインデックスを出力
console.log(array.indexOf(4, 2));

// 出力
3
-1  // 存在しない場合は -1 を返す
2


if (array.indexOf(1) !== -1){
  console.log('存在します');
}

if (array.indexOf(500) === -1){
  console.log('存在しません');
}

// 出力
"存在します"
"存在しません"
```


# 要素同士の結合
## **`join`**

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


# **要素の操作（追加・削除）**
ここからは配列そのものでなく，配列の中の要素一つ一つに何やかんやするためのものになります

# 先頭を削除
## **`shift`**

```javascript
const array = [4, 3, 2, 1];

array.shift();
console.log(array);

// 出力
[3, 2, 1]
```

# 末尾を削除
## **`pop`**

```javascript
const array = [4, 3, 2, 1];

array.pop();
console.log(array);

// 出力
[4, 3, 2]
```

# 先頭に追加
## **`unshift`**

```javascript
const array = [4, 3, 2, 1];

array.unshift(100);
console.log(array);

// 出力
[100, 4, 3, 2, 1]


array.unshift(300, 400);
console.log(array);

// 出力
[300, 400, 100, 4, 3, 2, 1]
```

# 末尾に追加
## **`push`**

```javascript
const array = [4, 3, 2, 1];

array.push(100);
console.log(array);

// 出力
[4, 3, 2, 1, 100]


array.push(300, 400);
console.log(array);

// 出力
[4, 3, 2, 1, 100, 300, 400]
```

# 要素の位置（インデックス）を指定して削除 & 追加
## **`splice`**

```javascript
const array = [4, 3, 2, 1];

// インデックスが「1」の要素を含めて，そこから2つ取り除く
array.splice(1, 2);
console.log(array);

// 出力
[4, 1]


// インデックスが「1」の要素を含めそこから1つも取り除かず，前に「600」を追加
array.splice(1, 0, 600);
console.log(array);

// 出力        
[4, 600, 1]


// インデックスが「1」の要素を含めそこから1つ取り除いて前に「800」,「900」を追加
array.splice(1, 1, 800, 900);
console.log(array);

// 出力
[4, 800, 900, 1]
```


# 並び替え
## **`sort`**
下記の，「要素の順序変更」とは異なります
`sort`はあくまで，**ある一定の基準による整頓**です

```javascript
// 昇順
const array1 = [4, 7, 56, 90, 1];
console.log(array1.sort());

// 降順
const array2 = [4, 7, 56, 90, 1];
const compare = (x, y) => y - x;  // 降順にするための"おまじない"みたいなものです
console.log(array2.sort(compare));

//出力
[1, 4, 7, 56, 90]
[90, 56, 7, 4, 1]
```


# 要素の順序変更 - 逆順
## **`reverse`**

```javascript
const array1 = [4, 3, 2, 1];
console.log(array1.reverse());

// 出力
[1, 2, 3, 4]
```


# ループ処理
## **`forEach`**
各要素に一度，与えられた関数を適用させます

```javascript
const array1 = [4, 3, 2, 1];
array1.forEach(value => {
  console.log(value);
});

// 出力
4
3
2
1
```

オブジェクトで利用したい場合

```javascript
const MyObject = {
  name: 'Tom',
  age: 49
};

Object.keys(MyObject).forEach(key => {
  console.log(`key: ${key} value: ${MyObject[key]}`);
});

// 出力
"key: name value: Tom"
"key: age value: 49"
```


# マッピング
## **`map`**
pythonやGo言語の`map`とは異なります
また，`forEach`は一つ一つの要素に処理を実行するだけで終わりですが，こちらは実行後の結果を配列データとして返却してくれます

```javascript
const array1 = [4, 3, 2, 1];
const newArray = array1.map(value => {
  return value * 2;
});

console.log(array1);
console.log(newArray);

// 出力
[4, 3, 2, 1]
[8, 9, 4, 2]

// ↓ のような書き方もできます

const array2 = [1,2,3,4,5,6,7,8,9];
// value: 配列の要素
// index: 配列のインデックス番号
// array: 現在処理している配列のことを指す
array2.map(( value, index, array ) => {

    //「array」と「index」を利用して、元の配列データを変更する
    array[index] = value * 2;
});

console.log(array2);

// 出力
[2, 4, 6, 8, 10, 12, 14, 16, 18]
```

`forEach`の上位互換ですね


# 複数要素の絞り込み
## **`filter`**

```javascript
const array1 = [40, 30, 20, 10];
const array2 = array1.filter(value => {
  return value > 20;
});

console.log(array2);

// 出力
[40, 30]
```


# 絞り込み（一つの要素のみ）
## **`find`**

```javascript
const array = [40, 30, 20, 10];

// 条件に当てはまるものを一つでも見つけ次第終了
const values = array.find(value => {
  return valur > 20
});

console.log(values);

// 出力
40
```

## 続きはこちら
https://zenn.dev/mkosakana/articles/9bcbf9d31968e2
