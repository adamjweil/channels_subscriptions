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
