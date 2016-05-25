class UsersController < ApplicationController
  def show
    @user = current_user
    @review = Review.new
  end
end
