class CreateUsers < ActiveRecord::Migration[5.1]#rails g model User name:string email:string
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
