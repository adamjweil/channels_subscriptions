get '/login' do
  erb :'/sessions/login'
end

post '/login' do
  if User.authenticate(params[:user][:email], params[:user][:password])
    session[:user_id] = User.find_by(email: params[:user][:email]).id
    redirect '/user/:id'
  else
    "Login Failed"
  end
end