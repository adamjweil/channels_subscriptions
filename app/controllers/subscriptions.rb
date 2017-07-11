post '/subscriptions' do
  @subscription = Subscription.new(user_id: current_user.id, channel_id: params[:channel] )
  if @subscription.save
    redirect "/users/#{current_user.id}"
  else
    redirect "/users/#{current_user.id}"
  end
end

delete '/subscriptions' do
  @subscription = Subscription.find_by(user_id: current_user.id,channel_id: params[:channel])
  @subscription.destroy
  redirect "/users/#{current_user.id}"
end
