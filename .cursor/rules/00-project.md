# repo-starter-kit (Cursor rules)

このリポジトリは「新しいアプリケーション/サービス用リポジトリを作るためのスターター」です。
ここで定義したルールは、**このテンプレートから生成された各プロジェクト**でも基本方針として引き継がれることを想定しています。

## 目的
- 運用の型（Issue/PR/SECURITY/CONTRIBUTING）を整備し、どの言語でも使える状態を作る
- CI で言語非依存の最低限チェック（pre-commit）を必須にする

## 変更方針（テンプレートそのものを編集するとき）
- 追加する自動化は **言語非依存** を優先（言語別lint/testは、テンプレ利用者の各プロジェクト側で追加してもらう）
- 破壊的変更は避け、必要なら README / docs に移行手順や影響範囲を追記する
- テンプレ内のプレースホルダ（`<PROJECT_NAME>` 等）は保持し、README で置換方法を案内する

## 利用プロジェクトでの前提
- テンプレから生成されたリポジトリでは、`<PROJECT_NAME>` などのプレースホルダを、実際のプロジェクト情報に置き換える
- 必要に応じて、言語やフレームワーク固有の lint / test / CI ステップを追加する

## テンプレートからリポジトリ作成直後のセットアップチェック

**このリポジトリが `repo-starter-kit` テンプレートから生成された直後と判断できる場合（プレースホルダが残っている、または `make init` が未実行の場合）、会話の冒頭で必ず以下をチェックし、未対応の項目をユーザーに通知・対応を促してください。**

### チェック項目

1. **プレースホルダが残っていないか確認する**
   - `README.md`, `CONTRIBUTING.md`, `SECURITY.md` に `<PROJECT_NAME>`, `<PROJECT_DESCRIPTION>`, `<SECURITY_CONTACT>` が残っていないか確認する
   - 残っている場合は実際の値に置き換えるよう提案し、可能であれば代わりに置換を実行する

2. **`make init` が実行済みか確認する**
   - `.git/config` の `core.hooksPath` が `.githooks` に設定されているか確認する
   - 未設定の場合は `make init` を実行するよう案内する（Docker が必要）

3. **`make check` でチェックが通るか確認する**
   - `make init` 済みであれば `make check` を実行して問題がないか確認するよう促す

4. **README.md の内容がプロジェクト向けに更新されているか確認する**
   - テンプレートのデフォルト説明文のままになっていないか確認し、プロジェクト固有の内容に更新するよう促す

> 詳細な手順は [`docs/EXAMPLE_TODO_APP.md`](docs/EXAMPLE_TODO_APP.md) を参照してください。

## ローカルチェック
- 初回: `make init`（Docker で `docker/pre-commit/Dockerfile` をビルドし、`.githooks` を有効化）
- 実行: `make check`（コンテナ内で pre-commit）

## ファイル配置の指針
- `docker/pre-commit/`: pre-commit 専用 Docker イメージ定義（アプリ言語とは独立）
- `.github/`: Issue/PRテンプレ、CI
- `docs/`: 運用/構成/設計ドキュメント
- `scripts/`: 言語非依存の補助スクリプト
