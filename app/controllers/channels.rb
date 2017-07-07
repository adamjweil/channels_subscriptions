get '/channels' do
  @all_channels = Channel.all
  erb :'/channels/index'
end

get '/channels/:id' do
  @current_channel = Channel.find_by(id: params[:id])
  erb :'/channels/show'
end

post '/channels/:id/subscribe' do
  Subscription.create(user_id: session[:user_id], channel_id: params[:id])
  redirect '/users/:id'
end

post '/channels/:id/unsubscribe' do
  current_user.subscriptions.each do |sub|
    if ((sub.user_id == current_user.id) && (sub.channel_id == current_channel.id))
      sub.delete
    end
  end
  redirect '/users/:id'
end
