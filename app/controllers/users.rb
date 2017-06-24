post '/user' do
  redirect '/user/new'
end

get '/user/new' do
  erb :register
end

post '/user/new' do
  user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], hashed_password: params[:user][:password])
    if user.save
      session[:user_id] = user.id
      redirect '/logged'
    else
      user.error.full_messages
      redirect '/user/new'
    end
end
