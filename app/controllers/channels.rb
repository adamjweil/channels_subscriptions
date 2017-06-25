get '/channels' do
  @channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:id' do
  @channel = Channel.find(params[:id]) #define instance variable for view
  erb :'channels/show' #show single channel view
end
