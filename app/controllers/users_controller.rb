get '/users/new' do
   erb :'user/new'
 end

 post '/users' do
   @user = User.new(params[:user])
   if @user.save
     redirect '/sessions/new'
   else
     erb :'user/new'
   end
 end


 get '/users/logout' do
   session[:id] = nil
   @user = nil
   redirect '/sessions/new'
 end


 get '/users/:id' do
   @user = User.find(params[:id]) #define instance variable for view
   erb :'users/show' #show single user view
 end
