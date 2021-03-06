class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Using strong parameters here, since passing a hash around
    # is wicked insecure
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to my Sample App ;)"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
