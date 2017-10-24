class PasswordToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :password, :string #テーブル名、カラム名、データ型
  end
end
