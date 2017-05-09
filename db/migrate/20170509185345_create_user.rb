class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :oauth_token
      t.integer :token_expiration

      t.timestamps
    end
  end
end
