get '/subscriptions/new' do
  # Ran into issue, did not get to test this
  Subscription.create(user_id: sessions[:user_id], channel_id: params[:id])
end
