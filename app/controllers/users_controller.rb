class UsersController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show]
  before_action :collect_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "update your profile!"
      redirect_to root_path
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :country, :password, 
                                  :password_confirmation)
  end
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def collect_user
    redirect_to root_path if !current_user?(@user)
  end
end
