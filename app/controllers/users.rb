get '/users' do
  erb :'/users/users_index'
end


get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  @users_channels = current_user.channels
  erb :'/users/show'
end
