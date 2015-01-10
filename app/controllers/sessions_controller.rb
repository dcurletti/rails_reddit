class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
        params[:user][:email],
        params[:user][:password])
    @user = User.new(email: params[:user][:email])

    if !user.nil?
      log_in!(user)
      redirect_to :root, notice: "Successfully logged in."
    else
      flash.now[:alert] = "Incorrect username, password combination."
      render :new
    end
  end

  def new
    @user = User.new()
  end

  def destroy
    log_out!
    redirect_to new_session_url, notice: "Successfully logged out!"
  end

  private
  def session_params
    params.require(:sessions).permit(:email, :password)
  end

end
