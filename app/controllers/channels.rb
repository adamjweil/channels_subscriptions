get '/channels' do
  @all_channels = Channel.all
  erb :'channels/index'
end

get '/channels/:id' do
  @current_channel = Channel.find_by(id: params[:id])
  channel_subscriptions = @current_channel.subscriptions
  @current_subscription = channel_subscriptions.find_by(user_id: session[:user_id])
  erb :'/channels/show'
end
