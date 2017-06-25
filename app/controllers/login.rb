get '/login' do
  "I will log people in:"
  erb :'/login'
end

post '/login' do
  "you are now logged in."
  # user = User.find_by(email: params[:email])
  # if user.authenticate (params[:password])
  #   session[:user_id] = user.id
  #   redirect '/restricted_area'
  # else
  #   erb :'/login'
  # end
end