# ffmpeg-mach-o-relocationer
HomebrewでインストールしたFFmpegを動的リンクする際に、`/usr/local/lib`に動的ライブラリを再配置し直すツールです。  
MacOSは[System Integrity Protection](https://support.apple.com/ja-jp/HT204899)によって`LD_LIBRARY_PATH`を環境変数として認識しません。  
したがって`/usr/local/lib/`配下、`/usr/lib`配下、あるいはカレントディレクトリからのみ動的ライブラリを探索しますが、Homebrewは`/opt/homebrew/Cellar/`配下にパッケージを落とすためにリンクできません。  
この問題自体はシンボリックリンクを貼ることで解決しますが、Homebrewでパッケージをアップデートする度に貼り直す必要があります。  
ffmpeg-mach-o-relocationerは、`/opt/homebrew/Cellar/ffmpeg/**/*.dylib`に対してシンボリックリンク`/usr/local/lib/*.dylib`を貼り直します。

```sh
$ ffmpeg-mach-o-relocationer
```