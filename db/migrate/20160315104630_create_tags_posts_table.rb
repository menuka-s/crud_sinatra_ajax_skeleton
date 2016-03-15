class CreateTagsPostsTable < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.references :post
      t.references :tag

      t.timestamps
    end
  end
end
