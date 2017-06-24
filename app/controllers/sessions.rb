get '/sessions/new' do 
  erb :'sessions/login'
end

post '/sessions' do 
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/secrets'
  else
    @errors = ['Invalid email or password']
    erb :'/sessions/login'
  end
end 

get '/logout' do 
  session.clear
  redirect '/'
end