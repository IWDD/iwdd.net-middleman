[![Build Status](https://travis-ci.org/IWDD/iwdd.github.io-middleman.png?branch=master)](https://travis-ci.org/IWDD/iwdd.github.io-middleman)

iwdd.github.io-middleman
========================

http://www.iwdd.net ( http://iwdd.github.io ) のソースコードです。

[https://github.com/IWDD/iwdd.github.io-middleman](https://github.com/IWDD/iwdd.github.io-middleman)  
がソースコードで、ここで開発をします。

開発をしたらpull requestを送ってください。

これをbuildした結果を担当者が    
[https://github.com/IWDD/iwdd.github.io](https://github.com/IWDD/iwdd.github.io)  
にコミットすることで、[http://www.iwdd.net](http://www.iwdd.net)が更新されます。

## 更新方法

1. [https://github.com/IWDD/iwdd.github.io-middleman](https://github.com/IWDD/iwdd.github.io-middleman)  
   を自分のgithubアカウントでforkする。

2. forkしたレポジトリを git clone する。
```
git clone https://github.com/あなたのID/iwdd.github.io-middleman.git
```

## 開発環境の整備

いまのところ使っているのは [middleman](http://middlemanapp.com/) + [slim](http://slim-lang.com/) + [scss](http://sass-lang.com/) + [CoffeeScript](http://coffeescript.org/)


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
