get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/signup'
end

post '/users' do
  @user = User.create(params[:users])
  erb :'/users/show'
end

get '/users/:id' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user != nil
    erb :'/users/show'
  else
    redirect '/'
  end
end
