get '/registrations/signup' do
    erb :'/registrations/signup'
end

post '/registrations' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    "Error message"
  end
end

get '/sessions/login' do
  erb :'sessions/login'
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

post '/sessions' do
  @user = User.authenticate(params[:user])
  if !!@user
    session[:id] = @user.id
    redirect "/sessions/#{@user.id}"
  else
    "ERROR"
  end
end

get '/sessions/:id' do
  if !!session[:id]
    @user = User.find(params[:id]) #define instance variable for view
    erb :'users/show' #show single user view
  else
    redirect '/'
  end
end
