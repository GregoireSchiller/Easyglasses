class ExamsController < ApplicationController

  def create
    @exam = Exam.new
    @user = current_user
    @exam.patient = @user
    @exam.exam_date = Date.today
    @exam.save
    redirect_to desktop_onboarding_eligible_exam_path(@exam)
  end

  def desktop_onboarding_eligible
    @user = current_user
    @exam = Exam.find(params[:id])
  end

  def desktop_onboarding
    @user = current_user
    @exam = Exam.find(params[:id])
  end

  def desktop_questions
    @questions = Question.all.order(position: :asc)
  end

  def desktop_results
    @exam = Exam.find(params[:id])
    count_left = 0
    count_right = 0
    @exam.user_answers.each_with_index do |answer, index|
      if answer.answered_orientation == Question.find_by(position: index + 1).orientation
        if answer.question.position < 11
          count_left += 1
        else
          count_right += 1
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
    @shoe_size = Exam.find(params[:id]).patient.shoe_size
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
