get '/' do

  erb :index
end


get '/Users/login' do
  erb :'users/login'
end

post '/Users/login' do
  if User.authenticate(params[:users])
    session[:user_id] = User.find_by(email: params[:users][:email]).id
    redirect '/Users/:id'
  else
    "Login Failed"
  end
end

get '/Users/:id' do
  @subscriptions = User.find_by(id: session[:user_id]).subscription

  erb :'Users/show'
end


get '/User/new' do

  erb :'Users/new'
end

get '/subscription/:id' do
  @subscriptions = User.find_by(id: session[:user_id])

  erb :'subscription/show'
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

post '/User/update' do
  p session
  p params
  @subscription = Subscription.find_by(user_id: session[:user_id])
  @subscription.assign_attributes(params[:user])
  if @user.save
    redirect :'Users/show'
  else
    @errors = @user.erros.full_messages
    erb :'Users/edit'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
