get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])
    if @user && @user.password == params[:user][:password]
      session[:id] = @user.id
      erb :'/account/show'
   else
      # make better
      redirect '/sessions/new'
    end
end


get '/sessions/:id' do
  @session = Session.find(params[:id]) #define instance variable for view
  erb :'sessions/show' #show single session view\
end
