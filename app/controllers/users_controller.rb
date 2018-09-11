class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  # GET /users
  def index
    # select * from users
    @users = User.all
  end

  # GET /users/:id

  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    #(runs validation when saved)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
