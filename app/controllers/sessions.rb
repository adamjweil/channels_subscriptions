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
  @user = User.create(params[:user])
  if @user.valid?
    session[:user_id] = User.find_by(email: params[:user][:email]).id
    redirect "/users/#{session[:user_id]}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'users/new', layout: false
  end
end

post '/sessions' do

  if User.authenticate(params[:user])
    session[:user_id] = User.find_by(email: params[:user][:email]).id
    redirect "/users/#{session[:user_id]}"
  else
    status 422
    @errors = ["Invalid email or password"]
    erb :'users/sessions', layout: false
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
