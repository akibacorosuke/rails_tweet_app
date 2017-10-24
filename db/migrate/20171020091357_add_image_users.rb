class AddImageUsers < ActiveRecord::Migration[5.1]#rails g migration add_image_usersで作成
  def change #テーブルに変更を加えるためにchangeメソッドの中に変更内容を書く
    add_column :users, :image_name, :string
  end#データ追加する テーブル  カラム    データ型 
end
