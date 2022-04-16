.PHONY: new
new: ## 記事ファイル作成
	npx zenn new:article

.PHONY: book
book: ## 本ファイル作成
	npx zenn new:book

.PHONY: view
view: ## プレビュー用のブラウザ開始
	npx zenn preview

.PHONY: update
update: ## zenn-cl の更新
	npm install zenn-cli@latest
