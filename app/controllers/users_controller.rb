class UsersController < ApplicationController
  
  before_action :authenticate_user, {only:[:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only:[:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only:[:edit, :update]}#異なるユーザーが編集できないように正しいユーザーかを確かめる

  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by(id: params[:id])
  	
  end
  def new #signup(新規ユーザー登録)
  	@user = User.new #ユーザー登録ページにアクセスした時のUserインスタンス
  	#新規登録ページのビューでUserクラスのインスタンスを使うようになったため、
#新規登録ページのアクションでも@user = User.newのようにしてインスタンスを用意します。
  end
  def create
  	@user = User.new(
  	name: params[:name], 
  	email: params[:email],
  	image_name: "IMG_0080.jpg",
  	password: params[:password]
  	)#:nameと:emailはname属性の値
  	if @user.save
  		session[:user_id] = @user.id #新規登録に成功したらログインする
  		redirect_to users_path
  		flash[:notice] = "user created"
  	else
  	render("users/new")
  	end	
  end

  def edit
  	@user = User.find_by(id: params[:id])
  	
  end

  def update #編集した時にデータベースに保存する
  	@user = User.find_by(id: params[:id])#投稿データを取得する
  	@user.name = params[:name] #フォームから送信された値
  	@user.email = params[:email] 
  	if params[:image] #画像が送信されている場合
  	@user.image_name = "#{@user.id}.jpg" #画像のファイル名をimage_nameカラムに保存
  	image = params[:image] #publicフォルダ内に画像を作成
  	File.binwrite("public/user_images/#{@user.image_name}",image.read)#画像データ取得
  	#ファイルの作成にFileクラスを使う。(画像データはFile.writeではなくFile.binwriteを用いる)
  	end
  	if @user.save
  	   flash[:notice] = "user updated"
  	   redirect_to users_path
    else
    	render("users/edit")
    end
   end

   def login_form
    	
   end

   def login
   	@user = User.find_by(email: params[:email], password: params[:password])
     #formに入力されたemail,passwordから該当するユーザーを取得し、ログインするユーザーを特定
   	if @user #userがいる場合
   		session[:user_id] = @user.id #ページを移動してもユーザー情報を保持し続ける(sessionの値はブラウザに保存される)
   		flash[:notice] = "you are logged in"
   		redirect_to posts_path
   	else 
   		@error_message = "email address or password you entered are wrong"
   		@email = params[:email]
   		@password = params[:password]

   		render("users/login_form")
   	end
   end

   def logout
   	session[:user_id] = nil #nilを代入してログアウトする
   	flash[:notice] = "you are logged out"
   	redirect_to login_path
   end

   def ensure_correct_user
   	if @current_user.id != params[:id].to_i#編集したいユーザーid(数値を取得するにはto_iメソッドを使う)
   		flash[:notice] = "User is wrong. Not entitled to edit"
   	end
   	
   end

   def likes
   	@user = User.find_by(id: params[:id])
   	@likes = Like.where(user_id:@user.id)#ユーザーに関するデータをlikesテーブルから取得
   	#@userと紐付くLikeインスタンスの配列をデータベースから取得
   	
   end

end
