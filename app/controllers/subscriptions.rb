  # add a subscription
post '/subscriptions' do
  channel = Channel.find(params[:channel_id])
  subs = Subscription.new(user: current_user, channel: channel)

  if subs.save
    redirect "/channels/#{channel.id}"
  else
    @channel = channel
    status 422
    erb :"/channels/show"
  end
end

  # remove a subscription
delete '/subscriptions/:id' do
  @subs = Subscription.find(params[:id])
  redirect "/channels/#{@subs.destroy.channel.id}"
end
