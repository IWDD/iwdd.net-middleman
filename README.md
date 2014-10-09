[![Build Status](https://travis-ci.org/IWDD/iwdd.github.io-middleman.png?branch=master)](https://travis-ci.org/IWDD/iwdd.github.io-middleman)

iwdd.github.io-middleman
========================

[IWDD公式サイト](http://iwdd.github.io)のソースコードです。

[https://github.com/IWDD/iwdd.github.io-middleman](https://github.com/IWDD/iwdd.github.io-middleman)  
がオリジナルのレポジトリです。



## 開発環境の整備

[Middleman](http://middlemanapp.com/) + [Slim](http://slim-lang.com/) + [SCSS](http://sass-lang.com/) + [CoffeeScript](http://coffeescript.org/) + [Pure CSS Framework](http://purecss.io/)


1. ディレクトリに移動  
  ```
  cd iwdd.github.io-middleman
  ```

2. 必要なGemファイルをインストールする  
  ```
  bundle install
  ```

3. 開発用サーバーを立ち上げる  
  ```
  bundle exec middleman server
  ```

4. [http://localhost:4567/](http://localhost:4567/) で確認する。


## 開発 & pull request

1. sourceディレクトリにソースコードがあるので、編集する。

2. 修正が終わったら自分のレポジトリに git commit して、githubでiwdd宛てにpull requestする。



## 毎月の定例更新方法

1. data/iwdd.yml にコンテンツがあるので、書き換えてローカルサーバーで確認
  ```
  bundle exec middleman server
  ```

2. ビルドする
  ```
  bundle exec middleman build
  ```

3. プルリクエストを送る

4. デプロイ
  ```
  bundle exec middleman deploy
  ```
