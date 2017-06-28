get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/signup'
end

get '/users/:id' do
  p params
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do
  @user = User.create(params[:users])
  erb :'/users/show'
end

post '/users/:id' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user != nil
    redirect "/users/#{@user.id}"
  else
    redirect '/'
  end
end
