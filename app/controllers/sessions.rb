get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  p "*"*100
  p params[:user][:email]
  p params[:user][:password]
  if !params[:user][:email].nil? || !params[:user][:password].nil?
    if User.authenticate(params[:user][:email],params[:user][:password])
      session[:user_id] = User.find_by(email: params[:user][:email]).id
      redirect '/'
    else
      redirect '/404'
    end
  else
    redirect '/404'
  end
end

get '/sessions/logout' do
  session.delete(:user_id)
  redirect '/'
end


=begin
  Resources
  1) ruby-doc.org on 'Hash' - delete method
  https://ruby-doc.org/core-2.2.3/Hash.html#method-i-delete
=end
