# プロジェクト構成

このリポジトリは「言語非依存のスターター」です。プロジェクト固有のコード構成は自由ですが、運用・ドキュメント・自動化は共通化するのを推奨します。

## 同梱ディレクトリ・ファイル

- `docker/pre-commit/`: 開発ツール（pre-commit）用の Docker 定義（アプリケーションの言語とは無関係）
- `.devcontainer/`: VSCode Dev Container 設定（`postCreateCommand` で `make init` を自動実行）
- `docs/`: 仕様、設計、運用手順、ADR（意思決定ログ）など
- `.github/`: Issue/PR テンプレ、GitHub Actions ワークフロー
- `.githooks/`: Git フック（`make init` で `core.hooksPath` として有効化）
- `AGENTS.md`: AIエージェント（Claude Code / Copilot / Cursor など）向けの汎用プロジェクト指示

## 追加推奨（必要に応じて作成）

- `scripts/`: 言語に依存しない運用スクリプト（例: リリース手順補助、整形、チェック）
- `.github/CODEOWNERS`: 自動レビュー担当割り当て（プロジェクトで必要になれば追加）

## ドキュメントの最低ライン（推奨）

- `README.md`: 目的、使い方、開発/運用の入口
- `CONTRIBUTING.md`: 変更の作法（PR、ブランチ、レビュー、ローカルチェック）
- `SECURITY.md`: 脆弱性報告窓口
- `CODE_OF_CONDUCT.md`: コミュニティ行動規範（同梱済み）

## 自動化の最低ライン（推奨）

- `pre-commit`: 言語非依存の基本チェック（このテンプレでは Docker 経由で実行）
- GitHub Actions: Docker 経由で `pre-commit run --all-files` をPRで必須化

## Makefile ターゲット

| コマンド | 内容 |
|---|---|
| `make init` | Docker イメージビルド＋キャッシュボリューム作成＋Git フック有効化 |
| `make check` | pre-commit 全ファイルチェック（キャッシュ使用で高速化） |
| `make lint` | `make check` のエイリアス |
| `make test` | テストスタブ（各プロジェクトで `Makefile` を上書き実装） |
| `make run` | 起動スタブ（各プロジェクトで `Makefile` を上書き実装） |
| `make clean` | Docker イメージ・キャッシュボリュームを削除 |
