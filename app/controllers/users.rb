get '/users/new' do
  "Form to create new user"
  erb :'/users'
end

post '/users' do
  @user = User.new(params[:user])
    if @user.save
      redirect '/users/#{@user.id}'
    else
      @errors = @user.errors.full_messages
      erb :'/users'
    end
end

get '/users/#{@user:id}' do
  "Heres the new user:"
end

