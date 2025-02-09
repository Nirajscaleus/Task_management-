class UsersController < ApplicationController
  def new
      @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:email] = @user.email
      redirect_to login_path, notice: "Account created successfully!... please log in"
    else
      render :new, notice: "please try agian..!"
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
  