# Liquid Docker 環境

このプロジェクトは、Liquidの最小動作環境をShopifyのテーマ構造に寄せて作成したものです。Dockerを使用することで、誰でも簡単にこの環境を再現できます。

---

# **プロジェクトの目的**

- **Liquidの学習**:
  Liquidテンプレートエンジンの動作を理解しやすくするため、最小限のコードで環境を構築しました。
- **Shopifyテーマ構造の模倣**:
  ShopifyテーマのJSONデータ構造やテンプレート構成を参考にしています。
- **再現性**:
  Dockerを利用することで、どの環境でも同じ動作を保証します。

---

# **ディレクトリ構造**

liquid_docker/
    ├── app.rb # SinatraでLiquidテンプレートを処理するメインスクリプト
    ├── Gemfile # 必要なRuby Gemのリスト
    ├── Gemfile.lock # Gemfileの依存関係を固定
    ├── Dockerfile # Docker環境を構築する設定ファイル
    ├── templates/ # Liquidテンプレートファイルを格納
    │ ├── theme.liquid # メインテンプレート
    │ └── footer.liquid # フッターテンプレート
    ├── config/ # JSONデータを格納
    │ ├── settings.json # テーマ設定データ
    │ └── data.json # 動的データ
    ├── assets/ # 静的ファイル（CSSやJSなど）

---

# **各ディレクトリの説明**

- **`app.rb`**:
  Sinatraを使った簡易サーバー。LiquidテンプレートにJSONデータを渡し、HTMLを生成します。

- **`Gemfile` と `Gemfile.lock`**:
  必要なGem（Sinatra, Liquid, JSONなど）を定義します。

- **`Dockerfile`**:
  このプロジェクトの環境をDockerで構築するための設定ファイル。

- **`templates/`**:
  Liquidテンプレートを格納するディレクトリ。
  - `theme.liquid`: メインのHTMLテンプレート。
  - `footer.liquid`: フッター部分を分割して管理。

- **`config/`**:
  JSON形式でテーマ設定や動的データを管理するディレクトリ。
  - `settings.json`: テーマの基本設定（例: テーマ名、フッターテキスト）。
  - `data.json`: ユーザー情報やカートデータなど、動的に扱うデータ。

- **`assets/`**:
  静的ファイル（CSSやJavaScriptファイルなど）を格納するためのディレクトリ。現時点では空ですが、必要に応じて利用可能。

---

# **使い方**

1. Docker環境を準備
    Dockerがインストールされていない場合は、公式サイトからインストールしてください。
    https://www.docker.com/

2. Dockerイメージのビルド
    docker build -t liquid_docker .

3. コンテナの起動
    docker run -it --rm -p 4567:4567 liquid_docker

4. ブラウザで確認
    http://localhost:4567

---

# **カスタマイズ方法**

1. テンプレートの編集:
   - templates/theme.liquid を編集することで、HTML構造をカスタマイズできます。
   - サブテンプレートを追加したい場合は、新しいLiquidファイルを templates/ に作成してください。

2. JSONデータの編集:
   - config/data.json に動的データを追加できます。
   - config/settings.json でテーマ設定を変更できます。

3. 静的ファイルの追加:
   - assets/ ディレクトリにCSSやJavaScriptを追加し、テンプレートで読み込むことができます。

---

# **ライセンス**

MIT License