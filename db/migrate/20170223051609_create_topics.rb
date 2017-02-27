class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|    
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :iamge
      t.timestamps null: false
    end
  end
end
