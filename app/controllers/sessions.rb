get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  if User.authenticate(params[:user][:email],params[:user][:password])
      session[:user_id] = User.find_by(email: params[:user][:email]).id
      redirect '/profile'
    else
      redirect '/404'
    end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end


=begin
  Resources
  1) ruby-doc.org on 'Hash' - delete method
  https://ruby-doc.org/core-2.2.3/Hash.html#method-i-delete
=end
