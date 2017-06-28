get '/channels' do
  @channels = Channel.all
  erb :'channels/index'
end


get '/channels/:id' do
  @channel = Channel.find_by(params[:id])
  redirect 'channels/show'
end
