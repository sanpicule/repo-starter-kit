# pre-commit 専用。アプリの言語とは無関係（コンテナ内で Python + pre-commit を固定する）
FROM python:3.12-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/*

# コンテナ内は root で動くため、マウントされたディレクトリを safe.directory に登録
RUN git config --global --add safe.directory /workspace

RUN pip install --no-cache-dir "pre-commit>=4,<5"

WORKDIR /workspace
