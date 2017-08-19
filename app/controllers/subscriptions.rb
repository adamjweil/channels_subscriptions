# create
post '/subscriptions' do
  # create a subscription
  channel = Channel.find(params[:channel_id])
  subscription = Subscription.new(channel: channel, user: current_user)

  if subscription.save
    redirect "/channels/#{channel.id}"
  else
    @channel = channel
    status 422
    erb :'channels/show'
  end

end

# delete
delete '/subscriptions/:id' do
  # delete the subscriptions
  # Subscription.find(params[:id]).destroy
  # Dont do this
  redirect "/channels/#{Subscription.find(params[:id]).destroy.channel.id}"
end
