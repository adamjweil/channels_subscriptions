get '/subscriptions' do
end

post '/subscriptions' do
  @subscription = Subscription.new(user_id: current_user.id, channel_id: params[:channel] )
  if @subscription.errors
  redirect "/users/#{current_user.id}"
  else
    @subscription.save
    redirect "/users/#{current_user.id}"
  end
end

# get '/subscriptions/:id' do
#   @subscription = Subscription.find_by()
# end

delete '/subscriptions' do
  @subscription = Subscription.find_by(user_id: current_user.id,channel_id: params[:channel])
  if @subscription
  @subscription.destroy
  redirect "/users/#{current_user.id}"
  else

  end
end
