class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    authorize @review
    if @review.save
      redirect_to user_path(@user)
    else
      redirect_to controller: "users", action: "show", id: @user.id
    end
  end

  def edit
  end

  def update
    authorize @review
    @review.update(review_params)
    redirect_to user_path(current_user)
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
