get '/channels/:id' do
  @channel = Channel.find_by(id: params[:id])
  @subs = Subscription.find_by(channel: @channel, user: current_user)
  erb :"/channels/show"
end
