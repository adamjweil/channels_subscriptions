def logged_in?
  !!current_user
end

def current_user
  User.find_by(id: session[:user_id])
end

def subscribed?(channel_to_check, user)
  channels = user.channels

  subscribed_to = channels.select do |channel|
    channel.id == channel_to_check
  end

  if subscribed_to.length > 0
    true
  else
    false
  end
end
