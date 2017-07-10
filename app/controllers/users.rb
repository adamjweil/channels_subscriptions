get '/users' do
  erb :'/users/users_index'
end


get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'/users/new'
  end
end

get '/users/:id' do
  @users_channels = current_user.channels
  erb :'/users/show'
end
