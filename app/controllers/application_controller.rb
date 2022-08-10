# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  add_flash_types :warning, :danger, :success

  def ensure_user_logged_in
    redirect_to '/homes/login' unless current_user
  end

  def current_user
    return @current_user if @current_user

    user_id = session[:current_user_id]
    @current_user = User.find(user_id) if user_id
  end
end
