class LikesController < ApplicationController
  before_action :authenticate_user #このcontrollerはログインしているユーザーのみに制限
  
  
  def create #いいねするデータとされるデータを取得し、保存
  	@like = Like.new(
  		user_id: @current_user.id,
  		post_id: params[:post_id]
  	)
  	@like.save
  	redirect_to("/posts/#{params[:post_id]}") #投稿者の詳細ページ
  end
  
  
  def destroy
    @like = Like.find_by(
      user_id:@current_user.id, 
      post_id:params[:post_id]
      )#これらを基に削除すべきLikeデータを取得
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end