# repo-starter-kit

言語やフレームワークに依存しない、GitHub用のスターターリポジトリです。  
「新規リポジトリ作成直後に必要になりがちなもの（運用テンプレ、基本設定、最低限の自動チェック、AIエージェント向け指示）」をまとめて提供します。

例えば、次のようなケースで利用することを想定しています。
- ToDoアプリや小さなAPIサーバーなど、新しいプロジェクトを素早く立ち上げたい
- 各チームや個人で、Issue/PR/セキュリティ報告の“型”を揃えたい
- 言語は都度変わるが、CIや最低限の品質ゲートだけは統一しておきたい

## 使い方（利用シーン）

### 1. GitHubでテンプレとして使う（推奨）
- GitHubのテンプレート機能（画面上の `Use this template`）で新規リポジトリを作成
- 生成されたリポジトリ側で、このREADME内のプレースホルダを置換（下記参照）
- `make init`（または `pre-commit install`）でローカルチェックを有効化
  - `pre-commit` を使うために **Python 3 が必要**です（アプリ本体の言語とは別の「開発ツール用の依存」です）

### 2. 既存リポジトリに導入する
- 必要なファイルだけをコピー（`LICENSE` 等は方針に応じて調整）
- `pre-commit` を導入し、CIで `pre-commit run --all-files` を回す

## 含まれるもの（新規リポジトリに入る共通セット）
- **共通ドキュメント**: `CONTRIBUTING.md`, `SECURITY.md`, `LICENSE`
- **GitHubテンプレ**: Issue/PR テンプレート
- **共通設定**: `.editorconfig`, `.gitignore`
- **自動チェック（言語非依存）**: `pre-commit`（末尾空白、改行、YAML、巨大ファイル、マージ競合など）
- **CI**: GitHub Actionsで `pre-commit` を実行
- **AIエージェント指示**: Cursor / GitHub Copilot / Claude Code 向け

## プレースホルダ（置換推奨）
このテンプレには、差し替え前提のプレースホルダが含まれます。

- `<PROJECT_NAME>`: リポジトリ/プロジェクト名
- `<PROJECT_DESCRIPTION>`: 短い説明
- `<SECURITY_CONTACT>`: 脆弱性報告先（メール/フォーム/窓口）

## ディレクトリ方針
詳細は `docs/PROJECT_STRUCTURE.md` を参照してください。

## ライセンス
MITライセンス（`LICENSE` を参照）