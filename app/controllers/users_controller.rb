class UsersController < ApplicationController
  def show
    @user = current_user
    @review = Review.new
  end

  def update_user_after_onboarding

  end
end
