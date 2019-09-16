class UsersController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Fazan Blog, #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit

  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your Account was updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    
  end

  private

  def set_article
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end