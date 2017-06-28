helpers do
def logged_in?
     !!@user
end
def find_user
     if session[:id]
       @user ||= User.find(session[:id])
     end
   end
end
