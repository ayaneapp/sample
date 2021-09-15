class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :singer
      t.string :lyrics
      t.string :link
      t.string :feeling

      t.timestamps
    end
  end
end
