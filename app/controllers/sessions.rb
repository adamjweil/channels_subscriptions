get '/login' do
  erb :'/users/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user
    user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/users/:id'
  else
    erb :'/users/login'
  end
end

