def current_user
  @user ||= User.find_by(id: session[:user_id])
end

def log_in?
  !!current_user
end


def require_user
  redirect '/sessions/new' unless  log_in?
end