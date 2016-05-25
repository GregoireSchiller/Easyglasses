class ExamsController < ApplicationController
  def create

  end

  def score

  end

  def desktop_onboarding

  end

  def desktop_questions
    @questions = Question.all.order(position: :asc)
  end

  def desktop_results

  end

  def mobile_onboarding

  end

  def mobile_questions

  end

  def mobile_results

  end

end
