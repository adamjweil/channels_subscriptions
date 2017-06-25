get '/' do
  erb :index
end

get '/new_user' do
  erb :new_user
end

post '/new_user' do
  create_user
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  login
end

get '/win' do
  erb :win
end
