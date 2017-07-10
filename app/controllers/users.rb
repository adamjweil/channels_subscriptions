get '/users' do
  "Hi User!"
end


get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/users'
  else
    erb :'/users/new'
  end
end
