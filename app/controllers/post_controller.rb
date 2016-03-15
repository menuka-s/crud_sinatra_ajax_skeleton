get '/posts/new' do
  erb :'posts/new'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'posts/edit'
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end

post '/posts' do
  @post = Post.new(params[:post])

  if @post.save
    tags = params[:tags]
    tags = tags.split(" ")
    tags.each do |tag|
      t = Tag.find_or_create_by(name: tag)
      t.posts << @post
    end
    redirect "/posts/#{@post.id}"
  else
    erb :errors
  end
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.assign_attributes(params[:post])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    erb :errors
  end
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end




