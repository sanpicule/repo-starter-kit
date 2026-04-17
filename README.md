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
- `make init` でローカルチェックを有効化（Docker で pre-commit 用イメージをビルドし、コミット時に必ず pre-commit が走るよう Git フックを設定します）
  - **Docker が必要**です（`pre-commit` はコンテナ内の Python で動きます。アプリ本体が Python である必要はありません）

> **具体的な手順（Todoアプリを例に）**: リポジトリ作成からアプリコード追加まで、ステップごとに解説しています。
> → [`docs/EXAMPLE_TODO_APP.md`](docs/EXAMPLE_TODO_APP.md)

### 2. 既存リポジトリに導入する
- 必要なファイルだけをコピー（`LICENSE` 等は方針に応じて調整）
- `docker/pre-commit/Dockerfile` と `Makefile` を使い、CI と同様に Docker 経由で `pre-commit run --all-files` を回す

## 含まれるもの（新規リポジトリに入る共通セット）

| 種別 | ファイル / パス | 内容 |
|---|---|---|
| 共通ドキュメント | `README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `LICENSE`, `LICENSE.ja` | 運用の型・ライセンス（日本語訳含む） |
| GitHub テンプレ | `.github/ISSUE_TEMPLATE/` (`bug_report.yml`, `feature_request.yml`, `config.yml`), `.github/pull_request_template.md` | Issue / PR テンプレ（`config.yml` で空 Issue を無効化） |
| 共通設定 | `.editorconfig`, `.gitignore`, `.dockerignore` | エディタ・Git・Docker の基本設定 |
| 自動チェック（言語非依存） | `.pre-commit-config.yaml`, `.pre-commit-ci.yaml` | 末尾空白、改行、YAML、巨大ファイル、マージ競合など |
| pre-commit 実行環境 | `docker/pre-commit/Dockerfile`, `Makefile`, `.githooks/pre-commit` | Docker 経由で pre-commit を実行（ローカル Python 不要） |
| CI | `.github/workflows/ci.yml` | GitHub Actions で Docker 経由の `pre-commit` を実行（GHA キャッシュ活用） |
| Dev Container | `.devcontainer/devcontainer.json` | VSCode でコンテナを開くと `make init` が自動実行 |
| AIエージェント指示 | `AGENTS.md` | [agents.md](https://agents.md/) 準拠の汎用エージェント向けプロジェクトルール（Claude Code / Copilot / Cursor / Aider / Codex など共通） |
| ドキュメント | `docs/PROJECT_STRUCTURE.md`, `docs/EXAMPLE_TODO_APP.md`, `docs/SETUP_CHECKS.md` | 構成ガイド・Todoアプリ例・生成直後のチェック項目 |

## pre-commit.ci（自動修正コミット）
`pre-commit` のフックが「修正可能な問題（末尾空白、末尾改行など）」を直した場合、通常のCIではその修正をコミットできず失敗します。
このテンプレには **pre-commit.ci** 用の設定（`.pre-commit-ci.yaml`）を含めており、pre-commit.ci を有効化すると **PR上に自動修正コミット**を追加できます。

有効化手順:
- pre-commit.ci 側で対象リポジトリを有効化する（サービス連携）

注意:
- fork からのPRなど、状況によっては自動修正ができない/行わない運用が適切な場合があります

## プレースホルダ（置換推奨）
このテンプレには、差し替え前提のプレースホルダが含まれます。

- `<PROJECT_NAME>`: リポジトリ/プロジェクト名（`.devcontainer/devcontainer.json` 等）
- `<SECURITY_CONTACT>`: 脆弱性報告先（メール/フォーム/窓口）（`SECURITY.md`）

また、以下は「プレースホルダ文字列」ではありませんが、テンプレから生成した直後に**手動で更新が必要**です。

- `LICENSE` / `LICENSE.ja`: 著作権年（`YYYY`）と著作権者名
- `README.md` / `CONTRIBUTING.md`: テンプレ説明文 → プロジェクト固有の内容へ書き換え

プレースホルダの検索は次のコマンドでできます。

```bash
grep -rIn --exclude-dir=.git -E '<(PROJECT_NAME|SECURITY_CONTACT)>' .
```

## 開発ツールとアプリの言語について
- `pre-commit` は **Docker イメージ**（`docker/pre-commit/Dockerfile`）の中で実行されます。
- これは「品質チェック用の実行環境」を揃えるためのもので、**ToDoアプリが Node / Go / Rust など何で書かれていても問題ありません**。

## ディレクトリ方針
詳細は `docs/PROJECT_STRUCTURE.md` を参照してください。

## ライセンス
MITライセンス。正本は [`LICENSE`](LICENSE)、参考訳として [`LICENSE.ja`](LICENSE.ja) を同梱しています
（法的効力は `LICENSE` のみ）。
