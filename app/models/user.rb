class User < ApplicationRecord #rails g model Userの時にできるファイル
	validates :name,  {presence: true}

	validates :email, {presence: true, uniqueness: true}#同じemailアドレスを保存させない

    validates :password, {presence: true}

    def posts #ユーザーが作成した投稿をまとめて取得できる
    	return Post.where(user_id: self.id) #self.idの投稿を戻り値とする
    	
    end

end

