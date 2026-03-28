# pre-commit 専用。アプリの言語とは無関係（コンテナ内で Python + pre-commit を固定する）
FROM python:3.12-slim-bookworm

RUN pip install --no-cache-dir "pre-commit>=4,<5"

WORKDIR /workspace
