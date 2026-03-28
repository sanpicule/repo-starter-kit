# pre-commit は Docker 内で実行（ローカルに Python は不要）
PRE_COMMIT_IMAGE ?= repo-starter-kit-pre-commit
DOCKERFILE := docker/pre-commit/Dockerfile

.PHONY: init check

init:
	docker build -t $(PRE_COMMIT_IMAGE) -f $(DOCKERFILE) .
	git config core.hooksPath .githooks

check:
	docker run --rm -v "$(CURDIR):/workspace" -w /workspace $(PRE_COMMIT_IMAGE) pre-commit run --all-files
