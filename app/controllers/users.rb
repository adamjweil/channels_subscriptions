# Sign up
get '/users/new' do
  # @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  puts user
  if user.valid?
    # success
    redirect '/'
  else
    # failure
    status 422
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end


# Login
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:user][:email], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    status 422
    @errors = ["Login Failed."]
    erb :'sessions/new'
  end
end


# Logout
delete '/logout' do
  # session[:user_id] = nil
  session.delete(:user_id)
  redirect '/'
end
