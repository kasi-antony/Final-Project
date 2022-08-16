# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def create
    if params[:manager]
      manager = User.new(user_params(:manager))
      manager.role = 'manager'
      if manager.save
        session[:current_user_id] = manager.id
        redirect_to '/manager_jobs/manager_home_page'
      end
    else
      interviewer = User.new(user_params(:interviewer))
      interviewer.role = 'interviewer'
      if interviewer.save
        session[:current_user_id] = interviewer.id
        redirect_to '/homes/index'
      end
    end
  end

  def sign_up
    @interviewer = User.new
    @manager = User.new
  end

  def user_login
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      if user.role == 'manager'
        redirect_to '/manager_jobs/manager_home_page', success: "You have been logged in as #{user.name}"
        # redirect_to '/users/login', danger: 'Invalid credentials...!'
        render plain: 'failed'
      end
    else
      render plain: 'failed'
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to '/users/login'
  end

  private

  def user_params(user)
    params.require(user.to_sym).permit(:name, :contact_number, :email, :password)
  end
end
