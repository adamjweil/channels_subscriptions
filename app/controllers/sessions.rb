get '/users/new' do
  erb :'/users/new', layout: false
end

get '/users/:id' do
  if logged_in?
    @user = User.find_by(id: session[:user_id])
    erb :'users/show'
  else
    erb :'/index'
  end
end

get '/users' do
  erb :'/users/sessions', layout: false
end


post '/users' do
  User.create(params[:user])
  redirect '/'
end

post '/sessions' do
  if User.authenticate(params[:user])
    session[:user_id] = User.find_by(email: params[:user][:email]).id
    redirect "/users/#{session[:user_id]}"
  else
    "Login Failed"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
