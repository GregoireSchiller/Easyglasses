class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :unable_user

  def show
    @user = current_user
    authorize @user
    @prescription = Prescription.new
    @review = current_user.review.nil? ? Review.new : current_user.review
  end

  def update_user_after_onboarding_eligible
    @user = current_user
    @exam = Exam.find(params[:user][:exam_id].to_i)
    authorize @exam
    @user.update({
      pregnant: params[:user][:pregnant],
      chronic_health_conditions: params[:user][:chronic_health_conditions],
      current_pain: params[:user][:current_pain],
      eye_surgery: params[:user][:eye_surgery]
    })

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
    authorize @user # always before updating
    @user.update(user_params)

    @exam = Exam.find(params[:user][:exam_id].to_i)

    @exam.update(token: SecureRandom.hex(7))

    twillio_number = "EasyGlasses"
    user_number    = "+33#{@user.phone_number}"

    message = <<~HEREDOC
      Click to begin your EasyGlasses exam:
      #{mobile_onboarding_exam_url(id: @exam.token)}
    HEREDOC

    SmsSender.new.send_message(twillio_number, user_number, message)
    redirect_to desktop_questions_exam_path(@exam)
  end

  private

  def user_params
    params.require(:user).permit(:pregnant, :chronic_health_conditions, :current_pain, :eye_surgery, :gender, :wearing_on_now, :worn_in_past, :shoe_size, :phone_number)
  end
end
