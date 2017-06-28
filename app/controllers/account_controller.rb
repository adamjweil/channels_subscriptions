get '/account/:id' do

  @account = Account.find(params[:id]) #define instance variable for view

  erb :'account/show' #show single account view

end
