class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags_posts, class_name: "TagsPosts"
  has_many :tags, through: :tags_posts

end
