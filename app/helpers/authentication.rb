helpers do
  def create_user
    @user = User.new(params[:user_info])
    @user.hashed_password = params[:user_info][:hashed_password]
    @user.save!
  end
  def login
    @user = User.find_by(email: params[:user_info][:email])
      if @user && @user.hashed_password == params[:user_info][:hashed_password]
        session[:id] = @user.id
        redirect '/win'
      else
        redirect '/'
      end
    end
    def logout
      session[:id] = nil
    end
end
