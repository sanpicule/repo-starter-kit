# テンプレート生成直後のセットアップチェック

AIエージェント（Claude Code / GitHub Copilot / Cursor など）は、本リポジトリが
`repo-starter-kit` テンプレートから生成された直後と判断できる場合（プレースホルダが残っている、
または `make init` が未実行の場合）、会話の冒頭で以下をチェックし、未対応の項目を
ユーザーに通知・対応を促してください。

## チェック項目

1. **プレースホルダが残っていないか確認する**
   - `README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `.devcontainer/devcontainer.json` に
     `<PROJECT_NAME>`, `<SECURITY_CONTACT>` が残っていないか確認する
   - 残っている場合は実際の値に置き換えるよう提案し、可能であれば代わりに置換を実行する
   - `LICENSE` / `LICENSE.ja` の著作権年・著作権者がテンプレのままでないかも合わせて確認する

2. **`make init` が実行済みか確認する**
   - `.git/config` の `core.hooksPath` が `.githooks` に設定されているか確認する
   - 未設定の場合は `make init` を実行するよう案内する（Docker が必要）

3. **`make check` でチェックが通るか確認する**
   - `make init` 済みであれば `make check` を実行して問題がないか確認するよう促す

4. **README.md の内容がプロジェクト向けに更新されているか確認する**
   - テンプレートのデフォルト説明文のままになっていないか確認し、
     プロジェクト固有の内容に更新するよう促す

> 生成直後の具体的な手順は [`EXAMPLE_TODO_APP.md`](EXAMPLE_TODO_APP.md) を参照してください。
