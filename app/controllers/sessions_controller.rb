class SessionsController
  
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

end