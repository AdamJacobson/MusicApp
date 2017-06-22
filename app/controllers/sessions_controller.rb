class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["Email or password was incorrect"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
