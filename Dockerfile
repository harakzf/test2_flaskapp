FROM python:3.7

# コンテナ内に/codeディレクトリ作成
RUN mkdir /code

# cdと同様
WORKDIR /code

# ホスト→コンテナにrequirements.txtをコピー
COPY requirements.txt /code

# コンテナにFlask環境を整える（パッケージインストール）
RUN pip install --upgrade pip --no-cache-dir
RUN pip install -r requirements.txt --no-cache-dir

# 開発資材をホスト→コンテナに移動
COPY ./test/ /code/

# コンテナのポート5000を解放
EXPOSE 5000

# コンテナ起動時に以下コマンドを実行
CMD ["python", "testapp.py"]