get '/users/new' do
  erb :'user/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/sessions/new'
  else
    erb :'users/new'
  end
end


get '/users/logout' do
  session[:id] = nil
  @user = nil
  redirect '/sessions/new'
end
