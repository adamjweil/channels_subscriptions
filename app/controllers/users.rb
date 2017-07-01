get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    erb :'/users/success'
  else
    erb :'/users/new'
  end
end

before '/users/:id' do
  unless logged_in?
    redirect '/'
  end
end

get '/users/:id' do
  erb :'/users/show'
end
