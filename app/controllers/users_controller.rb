class UsersController < ApplicationController
  def show
    @user = current_user
    @review = Review.new
  end

  def update_user_after_onboarding
    @user = current_user
    @user.update(user_params)
    @exam = Exam.find(params[:user][:exam_id].to_i)
    redirect_to desktop_questions_exam_path(@exam)
  end

  private

  def user_params
    params.require(:user).permit(:pregnant, :chronic_health_conditions, :current_pain, :eye_surgery, :gender, :wearing_on_now, :worn_in_past, :shoe_size, :phone_number)
  end
end
