class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :owned_profile, only: [:edit,:update]

  def show
    @posts = @user.posts.order('created_at DESC').page params[:page]
  end
  
  def edit

  end

  def update 
   if @user.update(profile_params)
      redirect_to root_path
      flash[:success] = "your Profile has been updated"
   else
   		error_messages = @user.error.full_messages
   		flash[:error] = 'error messages "#{error_messages}"..'
   end
  end

private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end
  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def owned_profile
   unless @user == current_user
     flash[:error] = "you are not authorized to do this"
     redirect_to root_path
   end
  end


end




















