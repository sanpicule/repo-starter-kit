# AGENTS.md

このファイルは、AIエージェント（Claude Code / GitHub Copilot / Cursor / Aider / Codex など）向けの
**汎用プロジェクト指示**です。エージェントごとに個別の設定ファイルを置く代わりに、
[agents.md](https://agents.md/) 準拠で一箇所にまとめています。

このリポジトリは、アプリケーションやサービスのソースコードを管理するプロジェクトです
（多くの場合、GitHub のスターターテンプレートから生成されています）。

## 原則

- 言語非依存のツール/チェック（`pre-commit` など）を活用して、基本的な品質を守る。
- 可能な限り後方互換を保ち、破壊的変更がある場合は移行手順を用意する。
- ワークフロー/挙動に影響する変更をした場合は、`README.md` や `docs/` を更新する。
- 追加する自動化は **言語非依存** を優先（言語別 lint/test はテンプレ利用者の各プロジェクト側で追加）。

## 品質ゲート

- ベースラインの品質ゲートは `pre-commit` とする。
- CI では Docker 経由で `pre-commit run --all-files` を実行し、PRでのチェックを通過させる。

## ローカルコマンド

- `make init` : Docker で pre-commit 用イメージをビルドし、Git フックを有効化（ローカルに Python は不要）
- `make check` : Docker 内で `pre-commit run --all-files` を実行（キャッシュボリューム使用）
- `make lint`  : `make check` のエイリアス
- `make test`  : テスト実行スタブ（各プロジェクトで実装）
- `make run`   : 起動スタブ（各プロジェクトで実装）
- `make clean` : Docker イメージ・キャッシュボリュームを削除

## プレースホルダの扱い

このプロジェクトがスターターテンプレートから生成された直後の場合、
以下のプレースホルダが残っていることがあります。

- `<PROJECT_NAME>`
- `<SECURITY_CONTACT>`

これらは、実際のプロジェクトに合わせて**意味のある値に置き換える**ことを優先してください。
`LICENSE` / `LICENSE.ja` の著作権年・著作権者も合わせて更新対象です。

## テンプレートからリポジトリ作成直後のセットアップチェック

このリポジトリが `repo-starter-kit` テンプレートから生成された直後と判断できる場合
（プレースホルダが残っている、または `make init` が未実行の場合）は、
[`docs/SETUP_CHECKS.md`](docs/SETUP_CHECKS.md) の項目に従って、
会話の冒頭でユーザーに通知・対応を促してください。

## ファイル配置の指針

- `docker/pre-commit/`: pre-commit 専用 Docker イメージ定義（アプリ言語とは独立）
- `.github/`: Issue/PR テンプレ、GitHub Actions
- `.githooks/`: Git フック（`make init` で有効化）
- `docs/`: 運用/構成/設計ドキュメント
- `scripts/`: 言語非依存の補助スクリプト（任意：必要に応じて作成）
