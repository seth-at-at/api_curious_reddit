class CreateSubreddit < ActiveRecord::Migration[5.0]
  def change
    create_table :subreddits do |t|
      t.string :display_name
      t.string :url
      t.integer :subscribers
      t.references :user, foreign_key: true
    end
  end
end
