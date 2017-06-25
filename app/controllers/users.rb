get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/signup'
end

post '/users' do
  @new_user = User.new(params[:users])
end

get '/users/:id' do

end
