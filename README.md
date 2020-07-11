# EC_TRAINING
ECサイトを構築するトレーニングリポジトリ

## 機能一覧
https://docs.google.com/spreadsheets/d/1CAd-I6MtNfblOJpzwAwl4U5GFhA9BVrlS8U-RXZLc7Q/edit?usp=sharing

## 業務フロー
WIP

## テーブル設計

### 商品テーブル(products)
- name
- price

### 在庫テーブル(stocks)
productsテーブルにquantityカラムを追加してもいいかもしれないが、<br>
マスタデータとトランザクションデータの意味的な違いも考慮して、テーブルを分けた。<br>
(マスタを更新しているわけではないのに、レコードにUPDATEが走るのはよろしくないと判断した)
- product_id
- quantity

### カートテーブル(carts)
user_idカラムはNULLを許容する(未ログイン状態でもカート機能を使用できる)。<br>
注文確定時にデータクリアされる。
- user_id

### カート明細テーブル(cart_details)
- cart_id
- product_id
- quantity

### 注文テーブル(orders)
- user_id
- order_code

### 注文明細テーブル(order_details)
構成はallocatesテーブルと変わらないが、こちらは注文内容を永続的に保持しておくために必要。
- order_id
- product_id
- quantity

### 引当テーブル(allocates)
注文確定でデータ生成され、出荷指示後1発目の在庫受信時にデータクリアされる。<br>
キャンセル時にもデータクリアされる。<br>
ライフサイクルは短いが、引当可能数算出ロジックや、出荷指示時に必要。
- order_id
- product_id
- quantity

### 出荷指示テーブル(shipping_instructions)
- product_id
- quantity

### 出荷実績テーブル(shipping_results)
倉庫側への欠品アラートを発報するために必要。
- product_id
- quantity

### ユーザーテーブル(users)
- screen_name
- email

### ユーザー情報テーブル(user_details)
- first_name
- last_name
