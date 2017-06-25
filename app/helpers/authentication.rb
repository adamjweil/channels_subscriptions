helpers do
  def create_user
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
    @user.save!
  end
  def login
    @user = User.find_by(email: params[:user][:email])
      if @user && @user.password == params[:user][:password]
        session[:id] = @user.id
        redirect '/account'
      else
        redirect '/sessions/new'
      end
  end
  def logged_in?
    !!@user
  end
  def find_user
    if session[:id]
      @user ||= User.find(session[:id])
    end
  end
end
