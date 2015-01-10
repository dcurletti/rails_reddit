class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :root, notice: "Successfully Created #{@user.email}"
    else
      #might send another model as well if needed
      flash.now[:errors] = "Could not create user."
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])

    if @user.destroy
      redirect_to root_url, notice: "Successfully logged out."
    else
      flash.now[:alert] = [ "Unable to log out." ]
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
