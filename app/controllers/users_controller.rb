class UsersController < ApplicationController
  def show
    @user = current_user
    @review = current_user.review.nil? ? Review.new : current_user.review
  end

  def update_user_after_onboarding_eligible
    @user = current_user
    @user.update(user_params)
    @exam = Exam.find(params[:user][:exam_id].to_i)
    if @user.pregnant == false && @user.chronic_health_conditions == false && @user.current_pain == false && @user.eye_surgery == false
      redirect_to desktop_onboarding_exam_path(@exam)
    else
      redirect_to unable_user_path
    end
  end

  def unable_user
    @user = current_user
  end

  def update_user_after_onboarding
    @user = current_user
    @user.update(user_params)
    @exam = Exam.find(params[:user][:exam_id].to_i)
    SmsSender.new.send_message("+33644601069", "+33" + @user.phone_number, "Click to begin your EasyGlasses exam: https://easyglasses.herokuapp.com/exams/" + @exam.id.to_s + "/mobile_onboarding")
    redirect_to desktop_questions_exam_path(@exam)
  end

  private

  def user_params
    params.require(:user).permit(:pregnant, :chronic_health_conditions, :current_pain, :eye_surgery, :gender, :wearing_on_now, :worn_in_past, :shoe_size, :phone_number)
  end
end
