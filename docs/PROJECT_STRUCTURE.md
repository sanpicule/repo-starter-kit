# プロジェクト構成

このリポジトリは「言語非依存のスターター」です。プロジェクト固有のコード構成は自由ですが、運用・ドキュメント・自動化は共通化するのを推奨します。

## 推奨ディレクトリ

- `docker/pre-commit/`: 開発ツール（pre-commit）用の Docker 定義（アプリケーションの言語とは無関係）
- `.devcontainer/`: VSCode Dev Container 設定（`postCreateCommand` で `make init` を自動実行）
- `docs/`: 仕様、設計、運用手順、ADR（意思決定ログ）など
- `scripts/`: 言語に依存しない運用スクリプト（例: リリース手順補助、整形、チェック）
- `.github/`: Issue/PRテンプレ、ワークフロー、CODEOWNERS等

## ドキュメントの最低ライン（推奨）

- `README.md`: 目的、使い方、開発/運用の入口
- `CONTRIBUTING.md`: 変更の作法（PR、ブランチ、レビュー、ローカルチェック）
- `SECURITY.md`: 脆弱性報告窓口

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
