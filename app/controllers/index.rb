get '/' do
  # erb :index no longer used
  redirect '/channels'
end

get '/404' do
  erb :'404'
end
