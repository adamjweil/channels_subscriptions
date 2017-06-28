get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
   @user = User.find_by(email: params[:user][:email])
     if @user && @user.password == params[:user][:password]
       session[:id] = @user.id
       erb :'/user/show'
    else
       redirect '/sessions/new'
     end
 end


get '/sessions/:id' do
   @session = Session.find(params[:id])
   erb :'sessions/show'
end
