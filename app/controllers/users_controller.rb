class UsersController < ApplicationController
  layout 'admin'
  before_action :set_user, :except => [:index]

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @user.update(user_params)
      flash[:success] = 'User created'
      redirect_to users_path
    else
      flash.now[:error] = 'User not created'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User updated'
      redirect_to users_path
    else
      flash.now[:error] = 'User not updated'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User deleted'
    else
      flash.now[:error] = 'User not deleted'
    end
    redirect_to users_path
  end


  private
  def set_user
    @user = User.exists?(params[:id]) ? User.find(params[:id]) : User.new
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :billing_id,
      :shipping_id
    )
  end
end
