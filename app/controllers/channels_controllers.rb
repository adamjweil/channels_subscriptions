get '/channels/index' do
  @channels = Channel.all
  erb :'channels/index'
end


get '/channels/:id' do
  @channel = Channel.find(params[:id])
  erb :'channels/show'
end


get '/channels/sessions/new' do
  redirect '/sessions/new'
end

post '/channel/subscription/new' do
  find_user
  @user.channels << Channel.find(params[:channel_id])
  redirect 'channels/index'
end

delete '/channel/subscription' do
  find_user
  @user.channels.delete( Channel.find(params[:channel_id]) )
  redirect '/account'
end
