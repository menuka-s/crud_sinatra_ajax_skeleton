get '/tags/:id' do
  @tag = Tag.find(params[:id]) #define instance variable for view
  erb :'tags/show' #shows single tag view
end
