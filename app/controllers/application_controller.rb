class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #全てのコントローラで共通する処理はapplicationコントローラにまとめることができる。
  #set_current_userメソッドを定義する
  before_action :set_current_user #set_current_userメソッドが各コントローラーで実行される


  def set_current_user
  	@current_user = User.find_by(id: session[:user_id])#現在ログイン中のユーザーを取得
  	
  end

  def authenticate_user #ログイン中のユーザーが存在するかチェックできる(ログインしていないとURLで直接アクセスすることはできない)
  	if @current_user == nil
  		flash[:notice] = "required to log in"
  		redirect_to("/login")
  	end
  end

  def forbid_login_user
  	if @current_user #ログイン済みのユーザーだった場合
  		flash[:notice] = "You are already logged in"
  		redirect_to posts_path
  	end
  	
  end
end
