def logged_in?
  !!current_user
end

def current_user
  User.find_by(id: session[:user_id])
end

def current_channel
  Channel.find_by(id: params[:id])
end

def total_cost
  sum = 0
  current_user.channels.each do |channel|
    sum += channel.price_per_month
  end
  return sum
end
