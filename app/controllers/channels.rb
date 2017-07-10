get '/channels' do
  @channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  @all_channels = Channel.all
  erb :'/channels/show'
end


put '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  redirect 'users/:id'
end


delete '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  @channel.destroy
  redirect '/users/:id'
end
