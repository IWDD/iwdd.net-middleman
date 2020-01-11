[![CircleCI](https://circleci.com/gh/IWDD/iwdd.net-middleman/tree/master.svg?style=svg)](https://circleci.com/gh/IWDD/iwdd.net-middleman/tree/master)

iwdd.net-middleman
========================

[IWDD公式サイト](https://iwdd.net)のソースコードです。

[https://github.com/IWDD/iwdd.net-middleman](https://github.com/IWDD/iwdd.net-middleman)
がオリジナルのレポジトリです。



## 開発環境の整備

[Middleman](http://middlemanapp.com/) + [Slim](http://slim-lang.com/) + [SCSS](http://sass-lang.com/)

1. git clone
  ```shell script
  git clone https://github.com/IWDD/iwdd.net-middleman.git
  ```

2. ディレクトリに移動
  ```shell script
  cd iwdd.net-middleman
  ```

3. 必要なGemファイルをインストールする
  ```shell script
  bundle install
  ```

4. 開発用サーバーを立ち上げる
  ```shell script
  bundle exec middleman server
  ```

5. [http://localhost:4567/](http://localhost:4567/) で確認する。


## 開発 & pull request

1. 開発用ブランチを切る

2. sourceディレクトリにソースコードがあるので、編集する。

3. 修正が終わったら git commit して、github で master に pull request する。

4. 問題なければ PR を accept する。

5. circle-ciが自動でbuildしてfirebase deployする。



## 毎月の定例更新方法

1. 開発用ブランチを切る

2. data/iwdd.yml にコンテンツがあるので、書き換えてローカルサーバーで確認
  ```shell script
  bundle exec middleman server
  ```

3. 修正が終わったら git commit して、github で master に pull request する。

4. 問題なければ PR を accept する。

5. circle-ciが自動でbuildしてdeployする。
