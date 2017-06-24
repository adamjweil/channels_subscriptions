get '/channels' do
  @all_channels = Channel.select(:name, :id)
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

post '/channels/:id/unsubscribe' do
  if current_user.channels.exists?(id: params[:id])
    new_subscription = Subscription.find_by(
      user_id: current_user.id,
      channel_id: params[:id])
    new_subscription.delete
  end
  redirect '/profile'
end

=begin
  References
  1) guides.rubyonrails.org on "Active Record Query Interface"
  http://guides.rubyonrails.org/active_record_querying.html
=end
