# pre-commit は Docker 内で実行（ローカルに Python は不要）
# イメージ名・キャッシュ名はリポジトリ名（カレントディレクトリ名）から導出し、
# 複数プロジェクトを同一ホストで扱うときの衝突を避ける。
PROJECT_SLUG ?= $(notdir $(CURDIR))
PRE_COMMIT_IMAGE ?= $(PROJECT_SLUG)-pre-commit
PRE_COMMIT_CACHE ?= $(PROJECT_SLUG)-pre-commit-cache
DOCKERFILE := docker/pre-commit/Dockerfile

export PRE_COMMIT_IMAGE

.PHONY: init check lint test run clean

init:
	docker build -t $(PRE_COMMIT_IMAGE) -f $(DOCKERFILE) .
	docker volume create $(PRE_COMMIT_CACHE) > /dev/null
	git config core.hooksPath .githooks

check:
	docker run --rm \
		-v "$(CURDIR):/workspace" \
		-v "$(PRE_COMMIT_CACHE):/root/.cache/pre-commit" \
		-w /workspace \
		$(PRE_COMMIT_IMAGE) pre-commit run --all-files

lint: check

# 各プロジェクトで上書きしてください（例: npm test / go test ./... / pytest）
test:
	@echo "testターゲットは各プロジェクトで実装してください"
	@echo "例: npm test | go test ./... | pytest"

# 各プロジェクトで上書きしてください（例: npm run dev / go run . / uvicorn main:app）
run:
	@echo "runターゲットは各プロジェクトで実装してください"
	@echo "例: npm run dev | go run . | uvicorn main:app --reload"

clean:
	docker rmi $(PRE_COMMIT_IMAGE) --force 2>/dev/null || true
	docker volume rm $(PRE_COMMIT_CACHE) 2>/dev/null || true
