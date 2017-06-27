post '/channels/:id/subscriptions/new' do
  Subscription.create(user_id: session[:user_id], channel_id: params[:id])
  redirect '/users/:id'
end

delete '/channels/:id/subscriptions/:id' do
  subscription_to_delete = Subscription.find(params[:id])
  subscription_to_delete.destroy
  redirect '/users/:id'
end
