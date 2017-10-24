class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
  	@posts = Post.all.order(created_at: :desc)#Postモデルのインスタンスを全て取得
  end

  def show
  	@post = Post.find_by(id: params[:id]) #idカラムがparams[:id]である投稿データを取得している	
  	@user = @post.user #投稿者を特定すると、returnでそのインスタンス自身を返す
  	@likes_count = Like.where(post_id: @post.id).count#countメソッドを使っていいねの数を数える
  end	

  def new
  	@post = Post.new #(このPostはモデル名。Postモデルに新規作成するということ)

  end

  def create #update(更新)と違って新しく作る
  	@post = Post.new(
  		content: params[:content],
  		user_id: @current_user.id#新規投稿時にuser_idの値を入れる
  		)
  	if @post.save
  	flash[:notice] = "created a new post"
  	redirect_to posts_path
    else
    	render("posts/new")
    end
  end

  def edit
  	@post = Post.find_by(id: params[:id])
  	
  end

  def update
  	@post = Post.find_by(id: params[:id])
  	@post.content = params[:content] #フォームの値を受け取る
  	if @post.save
  	   redirect_to posts_path
  	   flash[:notice] = "editted"
  	else
  	   render("posts/edit") #redirectと違い、このアクション内で定義した@変数をビューでそのまま使える
  	end #render("フォルダ名/ファイル名") メソッドは引数に、呼び出したいビューのフォルダ名とファイル名を指定します。
        # ファイル名の部分には拡張子（.html.erb）が必要ない
  	
  end

  def destroy
  	@post = Post.find_by(id: params[:id])
  	@post.destroy
  	flash[:notice] = "deleted"
  	redirect_to posts_path
  		
  end	

  def ensure_correct_user #投稿者とログイン中のユーザーが異なるかを調べるメソッド
  	@post = Post.find_by(id: params[:id])
  	if @post.user_id != @current_user.id
  		flash[:notice] = "you are not entitled"
  		redirect_to posts_path
  	end
  	
  end



end
