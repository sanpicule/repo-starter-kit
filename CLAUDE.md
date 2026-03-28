# Claude Code 向け指示

このリポジトリは、アプリケーションやサービスのソースコードを管理するプロジェクトです
（多くの場合、GitHub のスターターテンプレートから生成されています）。

## 原則

- 言語非依存のツール/チェック（`pre-commit` など）を活用して、基本的な品質を守る。
- 可能な限り後方互換を保ち、破壊的変更がある場合は移行手順を用意する。
- ワークフロー/挙動に影響する変更をした場合は、`README.md` や `docs/` を更新する。

## 品質ゲート

- ベースラインの品質ゲートは `pre-commit` とする。
- CI では Docker 経由で `pre-commit run --all-files` を実行し、PRでのチェックを通過させる。

## ローカルコマンド（推奨）

- `make init` : Docker で pre-commit 用イメージをビルドし、Git フックを有効化（ローカルに Python は不要）
- `make check` : Docker 内で `pre-commit run --all-files` を実行（キャッシュボリューム使用）
- `make lint`  : `make check` のエイリアス
- `make test`  : テスト実行スタブ（各プロジェクトで実装）
- `make run`   : 起動スタブ（各プロジェクトで実装）
- `make clean` : Docker イメージ・キャッシュボリュームを削除

## プレースホルダの扱い

このプロジェクトがスターターテンプレートから生成された直後の場合、
以下のようなプレースホルダが残っていることがあります。

- `<PROJECT_NAME>`
- `<PROJECT_DESCRIPTION>`
- `<SECURITY_CONTACT>`

これらは、実際のプロジェクトに合わせて**意味のある値に置き換える**ことを優先してください。

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
