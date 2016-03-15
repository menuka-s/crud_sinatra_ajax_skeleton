class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, :null => false
      t.string :title, :null => false
      t.references :user

      t.timestamps
    end
  end
end
