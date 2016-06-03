class ExamsController < ApplicationController
  skip_after_action :verify_authorized, only: :desktop_questions
  skip_after_action :verify_authorized, only: :mobile_questions
  skip_after_action :verify_authorized, only: :mobile_onboarding
  skip_after_action :verify_authorized, only: :mobile_results

  skip_before_action :authenticate_user!,                 only: [:mobile_onboarding]
  before_action      :authenticate_user_with_exam_token!, only: [:mobile_onboarding]

  def create
    @exam = Exam.new
    @user = current_user
    @exam.patient = @user
    @exam.exam_date = Date.today
    authorize @exam
    @exam.save
    redirect_to desktop_onboarding_eligible_exam_path(@exam)
  end

  def desktop_onboarding_eligible
    @user = current_user
    @exam = Exam.find(params[:id])
    authorize @exam
  end

  def desktop_onboarding
    @user = current_user
    @exam = Exam.find(params[:id])
    authorize @exam
  end

  def desktop_questions
    @questions = Question.all.order(position: :asc)
  end

  def desktop_results
    @exam = Exam.find(params[:id])
    authorize @exam
    @prescription = Prescription.new
    count_left = 0
    count_right = 0
    @exam.user_answers.each_with_index do |answer, index|
      if answer.orientation > 0
        if answer.answered_orientation == Question.find_by(position: answer.orientation).orientation
          if answer.question.position < 11
            count_left += 1
          else
            count_right += 1
          end
        end
      end
    end
    @exam.score_left = count_left
    @exam.score_right = count_right
    @exam.score_total = count_left + count_right
    @exam.recommendation = recommendation(@exam.score_total)
    @exam.save
  end

  def mobile_onboarding
    @shoe_size = @exam.patient.shoe_size
    @shoe_size_cm = (@shoe_size * 0.66) - 1
    @distance = 300 / @shoe_size_cm

    render layout: "mobile_onboarding"
  end

  def mobile_questions
    render layout: "mobile_onboarding"
  end

  def mobile_results
    render layout: "mobile_onboarding"
  end

  private

  def authenticate_user_with_exam_token!
    token = params[:id]
    @exam = Exam.find_by_token(token)

    if @exam
      sign_in(:user, @exam.patient)
    else
      flash[:error] = "Exam not found"
      redirect_to root_path
    end
  end

  def recommendation(score)
    if score > 15
      recommendation = "Your sight is amazing! No glasses needed."
    elsif score > 10
      recommendation = "Your sight is not optimal, you could use some glasses!"
    else
      recommendation = "You definitely need glasses!"
    end
    return recommendation
  end
end
