class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, index: true
      t.string :password_digest, null: false
      t.string :session_token, index: true

      t.timestamps null: false
    end
  end
end
