get '/channels' do
  @all_channels = Channel.select(:name)
  erb :'/channels/index'
end

get '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  erb :'/channels/show'
end

post '/channels/:id/subscribe' do
  if !current_user.channels.exists?(id: params[:id])
    new_subscription = Subscription.new(
      user_id: current_user.id,
      channel_id: params[:id])
    new_subscription.save
  end
  redirect '/profile'
end
