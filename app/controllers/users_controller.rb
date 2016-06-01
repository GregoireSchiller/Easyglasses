class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :unable_user

  def show
    @user = current_user
    authorize @user
    @review = current_user.review.nil? ? Review.new : current_user.review
  end

  def update_user_after_onboarding_eligible
    @user = current_user
    @user.update({
      pregnant: params[:user][:pregnant],
      chronic_health_conditions: params[:user][:chronic_health_conditions],
      current_pain: params[:user][:current_pain],
      eye_surgery: params[:user][:eye_surgery]
    })

    @exam = Exam.find(params[:user][:exam_id].to_i)
    authorize @exam
    if !@user.pregnant || !@user.chronic_health_conditions || !@user.current_pain || !@user.eye_surgery
      redirect_to unable_user_path
    else
     redirect_to desktop_onboarding_exam_path(@exam)
    end
  end

  def unable_user
    @user = current_user
  end

  def update_user_after_onboarding
    @user = current_user
    @user.update(user_params)
    authorize @user
    @exam = Exam.find(params[:user][:exam_id].to_i)
    SmsSender.new.send_message("+33644601069", "+33" + @user.phone_number, "Click to begin your EasyGlasses exam: www.easyglasses.io/exams/" + @exam.id.to_s + "/mobile_onboarding")
    redirect_to desktop_questions_exam_path(@exam)
  end

  private

  def user_params
    params.require(:user).permit(:pregnant, :chronic_health_conditions, :current_pain, :eye_surgery, :gender, :wearing_on_now, :worn_in_past, :shoe_size, :phone_number)
  end
end
