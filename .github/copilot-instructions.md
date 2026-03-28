# Copilot 向け指示

このリポジトリは、アプリケーションやサービスのコードを管理するためのプロジェクトです。
（多くの場合、スターターテンプレートから新規作成されています。）

## 目的
- 自動化はできるだけ言語非依存に保つ（ベースラインは `pre-commit`）。
- ワークフロー/挙動に影響する変更をした場合は、`README.md` や `docs/` を更新する。

## ローカルチェック
- `make init` で Docker により pre-commit 用イメージをビルドし、Git フックを有効化します（ローカルに Python は不要）。
- `make check` で Docker 内で `pre-commit run --all-files` を実行します（キャッシュボリューム使用）。
- `make lint` は `make check` のエイリアスです。
- `make test` / `make run` は各プロジェクトで実装するスタブです。
- `make clean` で Docker イメージ・キャッシュボリュームを削除します。

## プレースホルダ
スターターテンプレートから生成された直後のプロジェクトでは、次のようなプレースホルダが残っていることがあります。
- `<PROJECT_NAME>`
- `<PROJECT_DESCRIPTION>`
- `<SECURITY_CONTACT>`

これらはテンプレートのままではなく、**実際のプロジェクトに即した値に置き換える**ようにして下さい。

## テンプレートからリポジトリ作成直後のセットアップチェック

**このリポジトリが `repo-starter-kit` テンプレートから生成された直後と判断できる場合（プレースホルダが残っている、または `make init` が未実行の場合）、会話の冒頭で必ず以下をチェックし、未対応の項目をユーザーに通知・対応を促してください。**

### チェック項目

1. **プレースホルダが残っていないか確認する**
   - `README.md`, `CONTRIBUTING.md`, `SECURITY.md` に `<PROJECT_NAME>`, `<PROJECT_DESCRIPTION>`, `<SECURITY_CONTACT>` が残っていないかチェックする
   - 残っている場合は、実際の値に置き換えるようユーザーに提案し、可能であれば代わりに置換を実行する

2. **`make init` が実行済みか確認する**
   - `.git/config` の `core.hooksPath` が `.githooks` に設定されているか確認する
   - 未設定の場合は `make init` を実行するよう案内する（Docker が必要）

3. **`make check` でチェックが通るか確認する**
   - `make init` 済みであれば `make check` を実行して問題がないか確認するよう促す

4. **README.md の内容がプロジェクト向けに更新されているか確認する**
   - テンプレートのデフォルト説明文のままになっていないか確認し、プロジェクト固有の内容に更新するよう促す

> 詳細な手順は [`docs/EXAMPLE_TODO_APP.md`](docs/EXAMPLE_TODO_APP.md) を参照してください。
