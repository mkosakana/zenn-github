---
title: "JavaScript（TypeScript）配列操作まとめ ~中級編~"
emoji: "🎴"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["TypeScript", "JavaScript", "コーディングテスト", "プログラミング問題"]
published: true
---

[これ（基礎編）](https://zenn.dev/mkosakana/articles/1c9a9f083195e3)の続きです！
https://zenn.dev/mkosakana/articles/1c9a9f083195e3


# 配列のコピー生成
## **`slice`**
引数に何も指定しなければただのコピーです
指定した場合は，一部を抜粋して新たな配列をコピーしているというイメージです（元の配列には何の影響も無し）

```javascript
const array1 = [4, 3, 2, 1];
const array2 = array1.slice();

// コピーなので，array2 に要素を追加しても array1 に変化はない
array2.push(700);

console.log(array1);
console.log(array2);

// 出力
[4, 3, 2, 1]
[4, 3, 2, 1, 700]
    

const array3 = [4, 3, 2, 1];

// インデックスが「1」の要素を含めそこから最後まで取り出す
const NewArray = array3.slice(1);
console.log(NewArray);

// インデックスが「1」の要素を含めそこからインデックス「3」の要素の前まで取り出す
console.log(array3.slice(1, 3));

// 出力
[3, 2, 1]
[3, 2]
```


# 他の配列と結合
## **`concat`**

```javascript
const array1 = [4, 3, 2, 1];
const array2 = [5, 6];

console.log(array1.concat(array2));

// 出力
[4, 3, 2, 1, 5, 6]
```


# 配列の要素を固定値で埋める（置き換える）
## **`fill`**

```javascript
console.log([4, 5, 6, 7].fill(10));

// インデックスが「1」の要素を含めそこからインデックス「3」の要素の前まで埋める
console.log([4, 5, 6, 7].fill(10, 1, 3));

// 出力
[10, 10, 10, 10]
[4, 100, 10, 7]
```


# オブジェクト（連想配列）の操作
## **`Object.keys()`**

```javascript
const MyObject = {
  a: 'somestring',
  b: 42,
  c: false
};

console.log(Object.keys(MyObject));

// 出力
// オブジェクト（連想配列）のキーが配列型で出力される
Array ["a", "b", "c"]


// オブジェクト（連想配列）のキーの数
Object.keys(MyObject).length;  // 出力: 3
```


# 1つでも true であれば、true
## **`some`**

```javascript
const array = [40, 30, 20, 10];

console.log(array.some(value => {
  return value > 20;
}));

console.log(array.some(value => {
  return value > 60;
}));

// 出力
true
false
```


# すべてが true であれば、true
## **`every`**

```javascript
const array = [40, 30, 20, 10];

console.log(array.every(value => {
  return value > 20;
}))

console.log(array.every(value => {
  return value < 60;
}))


// 出力
false
true
```


# 参照
https://typescriptbook.jp/reference/values-types-variables/array/array-operations#%E9%9D%9E%E7%A0%B4%E5%A3%8A%E7%9A%84%E3%81%AA%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89%E3%81%AE%E4%B8%80%E8%A6%A7
