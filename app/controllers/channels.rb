get '/channels' do 
  @channels = Channel.all

  erb :'channels/index'
end

get '/channels/:id' do
  @channel = Channel.find(params[:id]) 

  erb :'channels/show'
end
