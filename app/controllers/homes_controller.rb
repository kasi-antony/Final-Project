class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    p current_user
  end

  def new
    user = User.new
  end

  def create
    user = User.new( user_params )
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
   else
    flash[:error] = user.errors.full_messages.join(",")               
    redirect_to '/homes/signup'
   end


  end

  private

  def user_params
    params.require(:user).permit(:name, :contact_number, :email, :password)
  end


end
