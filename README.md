# Godot SpriteSheet Importer

グリッド形式の1枚のスプライトシート画像を1つのカスタムリソースに詰め込みます。

AtlasTextureのtresファイルを大量に作成するよりも、Godotプロジェクトのファイルシステムやインポートファイル数に優しい仕組みになります。

![image](https://github.com/user-attachments/assets/2134af2c-b0b8-48a4-b56e-516da2b1cdf8)

## 使い方
アドオン設定でONにします。

スプライトシート画像をGodot内の任意のディレクトリに配置します。

同じ名前で拡張子を.spritesheetに変えた、空のファイルを置きます。

例：chara_1.png なら chara_1.spritesheet

Godotエディタから.spritesheetを見ると、インポートされています。
ただし、初期設定ではグリッドのサイズが64x64になっているので、正しいグリッドサイズに変更する必要があります。

インポート設定で、グリッドのサイズを変更します。
自分でカスタムプリセットを作っておき、それをデフォルトにすれば設定が楽になります。