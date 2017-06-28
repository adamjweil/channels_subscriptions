get '/channels' do
  @channels = Channel.all
  erb :'/channels/index'
end


post '/channels/:id' do
  @channel = Channel.find(params[:id])
  erb :'channels/show'
end

# post '/channels/:id' do
#   @channel = Channel.find(params[:id])
#   erb :'channels/show'
# end
