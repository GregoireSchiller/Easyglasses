require 'pusher'

class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new
    @user_answer.exam = Exam.find(params[:id])
    @user_answer.question = Question.find_by(position: params[:question_position].to_i)
    @user_answer.answered_orientation = params[:answered_orientation].to_i
    @user_answer.save
    PusherClient.get.trigger('my-channel', 'new_question', message: params[:question_position])
    if Exam.find(params[:id]).user_answers.count < 3
      redirect_to :back
    else
      redirect_to mobile_results_exam_path(params[:id])
    end
  end
end
