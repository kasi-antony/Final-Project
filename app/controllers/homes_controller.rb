# frozen_string_literal: true

class HomesController < ApplicationController
  # skip_before_action :ensure_user_logged_in
  def index; end

  def new
    user = User.new
  end
end
