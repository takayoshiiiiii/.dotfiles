## 主にMac用のneovimの設定
### 導入が必要なもの
1. Python周り(Python3が入っていること)
* neovim
* flake8
この２つが入っていないとdeoplete,ale周りが動かない

2. R周り
* Rのlinterを使うためにRのパッケージlintrも別途インストールしておいてくださいな

* Rmarkdown環境を作ったので，rmarkdownパッケージもインストールすること

#### 注意点
previmとpandocが競合っぽいことが起きているので[以下のページ](http://onigiri11235.tumblr.com/post/113676372604/previm%E3%81%A8vim-pandoc%E3%81%A7%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%8C%E5%87%BA%E3%81%9F)を参照して，previmnのソースファイルを変更する必要あり！
