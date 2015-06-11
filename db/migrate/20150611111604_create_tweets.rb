class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content, limit: 140
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
