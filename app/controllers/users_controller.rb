class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :show, :update, :destroy]
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to '/main_menus/index'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = '編集を完了しました。'
      redirect_to '/main_menus/index'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :edit
    end
  end

  def destroy
  end
  
    def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
