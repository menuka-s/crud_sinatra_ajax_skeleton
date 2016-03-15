get '/' do
  erb :'index'
end

get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

get '/users/login' do
  erb :'/users/login'
end

get '/users/logout' do
  session[:user_id] = nil
  redirect :'/'
end

get '/users/authenticate' do
  @user = User.find_by(email: params[:email])
  if @user != nil
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = true
      erb :'/users/login'
    end
  else
    @errors = true
    erb :'/users/login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = true
    erb :'/users/new'
  end
end
