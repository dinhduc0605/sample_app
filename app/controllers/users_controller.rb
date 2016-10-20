class UsersController < ApplicationController
  before_action :logged_in_user, only: [:update, :edit, :index]
  before_action :correct_user, only: [:update, :edit]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
    @microposts = @user.microposts.paginate page: params[:page]
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".info"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t(".success")
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(".success")
    redirect_to users_url
  end

  def following
    @title = t ".title"
    @user  = User.find params[:id]
    @users = @user.following.paginate page: params[:page]
    render "show_follow"
  end

  def followers
    @title = t ".title"
    @user  = User.find params[:id]
    @users = @user.followers.paginate page: params[:page]
    render "show_follow"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to(root_url) unless current_user? @user
  end

end
