# 使用例: Todoアプリの環境構築

このドキュメントは、`repo-starter-kit` を使って **Todoアプリ** のリポジトリを新規作成し、開発を始めるまでの手順を説明します。

---

## 1. リポジトリの作成

### 方法A: GitHub の画面から作成（推奨）

1. [sanpicule/repo-starter-kit](https://github.com/sanpicule/repo-starter-kit) を開く
2. 右上の **「Use this template」→「Create a new repository」** をクリック
3. リポジトリ名（例: `todo-app`）、説明、公開設定を入力して作成

### 方法B: GitHub CLI（`gh`）で作成

```bash
gh repo create todo-app \
  --template sanpicule/repo-starter-kit \
  --public \
  --clone
```

> **オプション説明**
> - `--template`: テンプレートリポジトリを指定
> - `--public` / `--private`: 公開設定（`--private` に変更も可）
> - `--clone`: 作成後ローカルにクローン

---

## 2. ローカルへのクローン（方法Aの場合）

方法Aで作成した場合はクローンします（方法Bの `--clone` を使った場合は不要）。

```bash
gh repo clone <YOUR_USERNAME>/todo-app
# または
git clone https://github.com/<YOUR_USERNAME>/todo-app.git

cd todo-app
```

---

## 3. プレースホルダの置換

テンプレートには差し替え前提のプレースホルダが含まれています。
プロジェクト固有の値に置換してください。

| プレースホルダ | 置換例 |
|---|---|
| `<PROJECT_NAME>` | `todo-app` |
| `<PROJECT_DESCRIPTION>` | `シンプルなTodoアプリ` |
| `<SECURITY_CONTACT>` | `security@example.com` |

```bash
# macOS の場合
find . -type f \( -name "*.md" \) \
  -not -path "./.git/*" \
  -exec sed -i '' \
    -e 's/<PROJECT_NAME>/todo-app/g' \
    -e 's/<PROJECT_DESCRIPTION>/シンプルなTodoアプリ/g' \
    -e 's/<SECURITY_CONTACT>/security@example.com/g' \
    {} +
```

---

## 4. ローカルチェックの有効化

品質チェック（`pre-commit`）を Docker 経由で動かします。
**Docker が起動していることを確認してから実行してください。**

```bash
make init
```

このコマンドは以下を行います:

1. `pre-commit` 用 Docker イメージをビルド（ローカルに Python は不要）
2. Git フックを有効化（コミット時に自動で `pre-commit` が走るようになる）

---

## 5. 動作確認

```bash
make check
```

全ファイルを対象に `pre-commit run --all-files` が実行されます。
以下のようなチェックが走ります:

- 末尾の不要な空白・改行
- YAML 構文チェック
- 大きすぎるファイルの検出
- マージ競合マーカーの検出

---

## 6. アプリのコードを追加する

このテンプレートは **言語非依存** です。
Todoアプリは好みの言語・フレームワークで実装できます。

```
todo-app/
├── .github/          # Issue/PR テンプレ、GitHub Actions
├── docker/
│   └── pre-commit/   # 品質チェック用（アプリとは独立）
├── docs/             # 設計・仕様ドキュメント
├── src/              # ← アプリのコードをここに追加（例）
│   ├── app.ts
│   └── ...
├── README.md
├── Makefile
└── ...
```

**例: Node.js + TypeScript の場合**

```bash
npm init -y
npm install express
npm install -D typescript @types/node @types/express ts-node
npx tsc --init
```

**例: Go の場合**

```bash
go mod init github.com/<YOUR_USERNAME>/todo-app
```

**例: Python + FastAPI の場合**

```bash
python -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn
```

---

## 7. 最初のコミット & プッシュ

```bash
git add .
git commit -m "chore: initial setup from repo-starter-kit"
git push origin main
```

コミット時に `pre-commit` が自動で走ります（`make init` 済みの場合）。

---

## 8. GitHub Actions の確認

リポジトリの **Actions タブ** を開き、CI（`pre-commit run --all-files`）が正常に通ることを確認してください。

---

## まとめ

| ステップ | コマンド/操作 |
|---|---|
| リポジトリ作成（CLI） | `gh repo create todo-app --template sanpicule/repo-starter-kit --public --clone` |
| プレースホルダ置換 | `sed` コマンド or エディタで一括置換 |
| ローカルチェック有効化 | `make init` |
| チェック実行 | `make check` |
| アプリコード追加 | 任意の言語で `src/` 等に実装 |
| 初回コミット | `git commit -m "chore: initial setup"` |
