class ReviewsController < ApplicationController

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id)
  end

end
