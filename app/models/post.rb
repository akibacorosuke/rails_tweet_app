class Post < ApplicationRecord
end
#postsテーブルを使うためにモデルというクラスを用いてデータベースを使う。
#rails g modelコマンドでpostsテーブルを操作するためのPostモデルができる。
#AppicationRecordを継承したクラス(Post)をモデルと呼ぶ
#rails g model Post content:text のPostはモデル名、contentはカラム名、textはデータ型