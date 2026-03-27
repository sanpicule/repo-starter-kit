.PHONY: init check

init:
	python3 -m pip install --user pre-commit
	pre-commit install

check:
	pre-commit run --all-files
