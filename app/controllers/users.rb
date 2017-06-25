get '/users' do
  erb :'users/index'
end

get '/users/new' do
  erb :'/users/signup'
end

post '/users' do
  @new_user = User.create(params[:users])
end

get '/users/:id' do
  p user = User.authenticate(params[:user][:email], params[:user][:password])
  if user != nil
    erb :'/users/show'
  else
    redirect '/'
  end
end
