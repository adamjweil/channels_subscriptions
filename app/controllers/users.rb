get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  new_user = User.create(params[:user])
  if new_user.valid?
    redirect '/'
  else
    status 422
    @errors = new_user.errors.full_messages
    erb :'/users/new'
  end
end

get '/user/:id' do
  "Hello World"
end
