class Post < ApplicationRecord
	validates :content, {presence:true, length: {maximum: 100}}
	validates :user_id, {presence:true}


	def user
		return User.find_by(id:self.user_id)
	end#posts_controllerのshowアクションで@userに@post.user(このreturnメソッドを代入)	

end
#postsテーブルを使うためにモデルというクラスを用いてデータベースを使う。
#rails g modelコマンドでpostsテーブルを操作するためのPostモデルができる。
#AppicationRecordを継承したクラス(Post)をモデルと呼ぶ
#rails g model Post content:text のPostはモデル名、contentはカラム名、textはデータ型

#validates :検証カラム名, {presence:true}
#Railsではモデル内にインスタンスメソッドを定義することができ、postインスタンスに対して用いることができる