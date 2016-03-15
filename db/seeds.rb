require 'faker'

tag_list = []

4.times do |x|
  tag = Tag.create(name: Faker::Hipster.word)
  tag_list << tag
end

3.times do |x|

  user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "password")

  3.times do |y|
    post = Post.create(content: Faker::Hipster.paragraph(2), title: Faker::Hipster.sentence(3), user: user)
    tag_sample = tag_list.sample(2)
    post.tags << tag_sample[0] << tag_sample[1]
  end

end


