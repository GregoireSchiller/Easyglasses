class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def update_user_after_onboarding

  end
end
