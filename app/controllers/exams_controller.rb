class ExamsController < ApplicationController
  def create
    @exam = Exam.new
    @user = current_user
    @exam.user = @user
    @exam.exam_date = Date.today
    @exam.save
    redirect_to desktop_onboarding_exam_path(@exam)
  end

  def score

  end

  def desktop_onboarding
    @user = current_user
    @exam = Exam.find(params[:id])
  end

  def desktop_questions
    @questions = Question.all.order(position: :asc)
  end

  def desktop_results

  end

  def mobile_onboarding
    render layout: "mobile_onboarding"
  end

  def mobile_questions
    @skip_footer = true
    @skip_navbar = true
  end

  def mobile_results

  end

end
