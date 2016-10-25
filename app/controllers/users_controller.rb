class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)

      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      render '/users/show.html'
    else
      redirect_to new_session_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to(user)
    else
      redirect_to(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end
end
