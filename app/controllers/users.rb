get '/users/new' do
  @user = User.new
  erb :'/users/new_user'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.valid? && params[:user][:password].length>0
    @user.save
    erb :'/users/success'
  else
    erb :'/users/new_user'
  end
end
