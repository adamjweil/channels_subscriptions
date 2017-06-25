get '/users/new' do
  erb :'users/new'
end


post '/users' do
  #below works with properly formatted params in HTML form
  create_user
  redirect '/sessions/new'
end

get '/users/logout' do
  session[:id] = nil
  @user = nil
  redirect '/sessions/new'
end
