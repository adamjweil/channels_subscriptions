get '/account' do
  find_user
  erb :'accounts/index'
end
