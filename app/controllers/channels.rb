get '/channels' do
  # channels = Channel.all
  @channels = Channel.all
  erb :index
end

get '/channels/:id' do
  # @channel = Channel.find_by(id: params[:id])
  @channel = Channel.find(params[:id])
  @subscription = Subscription.find_by(channel: @channel, user: current_user)
  puts "current_user: #{current_user}"
  erb :'channels/show'

end

get '/user/channels/:id' do
  # @channel = Channel.find_by(id: params[:id])
  @channel = Channel.find(params[:id])
  @subscription = Subscription.find_by(channel: @channel, user: current_user)
  puts "current_user: #{current_user}"
  erb :'channels/show'

end
