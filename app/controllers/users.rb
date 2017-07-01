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

before '/users/:id/profile' do
  unless logged_in?
    redirect '/404'
  end
end

get '/users/:id/profile' do
  erb :'/users/show'
end
