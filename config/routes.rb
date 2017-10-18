Rails.application.routes.draw do
  #どのURLにアクセスされたときに、controllerのどのメソッドを実行するかを設定する

  resources :posts #一般的な処理を一気に設定する
  
  
  root "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
