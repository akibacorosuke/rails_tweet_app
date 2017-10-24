Rails.application.routes.draw do
  


  #どのURLにアクセスされたときに、controllerのどのメソッドを実行するかを設定する
  resources :likes
  resources :users
  resources :posts #一般的な処理を一気に設定する
  get "users/:id/likes" => "users#likes" #いいねされた投稿を一覧で表示する。likesアクションをusers ctlr内に作成
       #どのユーザーかを判断するためにidを含ませる
  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/create" => "likes#create"
  post "logout" => "users#logout" #sessionの値を変更するときはpost
  post "login" => "users#login" #fromの値を送信するのでpost。postのルーティングを探す
  get "login" => "users#login_form"
  post "users/:id/update" => "users#update"
  post "posts/:id/update" => "posts#update"
  
  root "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
