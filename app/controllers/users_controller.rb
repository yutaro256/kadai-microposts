class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:show, :index]
  
  def index
    @users = User.all.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params['id'])
  end

  def new
    @user =User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      puts 'a'
      render :new
    end
  end
  
    private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end