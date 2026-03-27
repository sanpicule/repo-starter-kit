# Claude Code 向け指示

このリポジトリは、アプリケーションやサービスのソースコードを管理するプロジェクトです  
（多くの場合、GitHub のスターターテンプレートから生成されています）。

## 原則

- 言語非依存のツール/チェック（`pre-commit` など）を活用して、基本的な品質を守る。
- 可能な限り後方互換を保ち、破壊的変更がある場合は移行手順を用意する。
- ワークフロー/挙動に影響する変更をした場合は、`README.md` や `docs/` を更新する。

## 品質ゲート

- ベースラインの品質ゲートは `pre-commit` とする。
- CI では `pre-commit run --all-files` を実行し、PRでのチェックを通過させる。

## ローカルコマンド（推奨）

- `make init` : pre-commit のインストールとフック有効化
- `make check` : `pre-commit run --all-files` の実行

## プレースホルダの扱い

このプロジェクトがスターターテンプレートから生成された直後の場合、
以下のようなプレースホルダが残っていることがあります。

- `<PROJECT_NAME>`
- `<PROJECT_DESCRIPTION>`
- `<SECURITY_CONTACT>`

これらは、実際のプロジェクトに合わせて**意味のある値に置き換える**ことを優先してください。*** End Patch```} ?>
    </tool>
    <tool name="functions.ApplyPatch">*** Begin Patch

