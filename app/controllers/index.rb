get '/' do

  erb :index
end


get '/Users/login' do
  erb :'users/login'
end

post '/Users/login' do
  if User.authenticate(params[:users])
    session[:user_id] = User.find_by(email: params[:users][:email]).id
    redirect '/'
  else
    "Login Failed"
  end
end


get '/User/new' do

  erb :'Users/new'
end

post '/User/new' do
  p params
  @user = User.new(params[:users])

  if @user.save
    redirect '/Users/login'
  else
    @user = @user.errors.full_messages
    erb :'Users/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
