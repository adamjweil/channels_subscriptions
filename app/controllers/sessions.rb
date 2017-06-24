enable :sessions

get '/' do
  erb :index
end

post '/' do
  user = User.authenticate(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect '/logged'
    else
      "Login Failed. You do not have an account with us. Please sign up here:"
      redirect '/user/new'
    end
end

get '/logged' do
  erb :'sessions/logged'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
