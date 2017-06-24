get '/channels' do
  @all_channels = Channel.all
  erb :'channels/index'
end

get '/channels/:id' do
  @current_channel = Channel.find_by(id: params[:id])
  erb :'/channels/show'
end
