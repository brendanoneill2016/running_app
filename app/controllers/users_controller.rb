class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: :destroy



  def index
    @users = User.paginate(page: params[:page])
  end

  def show
	  @user = User.find(params[:id])
    @signups = Signup.where(user_id: params[:id])
    @user_signups = []

      @signups.each do |u|
        @user_signups << u.event_id

      end 
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)   

    if user_params[:pin] == "6892" 
      if @user.save
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account. It can sometimes take a few mins for the email to arrive, so don't panic if you don't receive it within a few seconds! :) "
        redirect_to root_url

      else
        render 'new'
      end
    else
      flash[:danger] = "Incorrect PIN: Your account was not created"
      redirect_to root_url
    end
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user

    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                                   :password_confirmation, :pin)
    end



  
end
