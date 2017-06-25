helpers do

  def subscribed?
    @user.channels.include? @channel
  end

end
