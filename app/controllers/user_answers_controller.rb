require 'pusher'

class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.new
    @user_answer.exam = Exam.find(params[:id])
    @user_answer.question = Question.find(5)
    @user_answer.answered_orientation = 3
    @user_answer.save
    PusherClient.get.trigger('my-channel', 'new_question', message: "hello")
    redirect_to :back
  end
end
