.PHONY: init check

init:
	python3 -m venv .venv
	.venv/bin/python -m pip install --upgrade pip
	.venv/bin/pip install pre-commit
	git config core.hooksPath .githooks

check:
	.venv/bin/pre-commit run --all-files
