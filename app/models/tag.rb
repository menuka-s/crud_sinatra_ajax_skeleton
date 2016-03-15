class Tag < ActiveRecord::Base
  has_many :tags_posts, class_name: "TagsPosts"
  has_many :posts, through: :tags_posts
end
