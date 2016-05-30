class PrescriptionsController < ApplicationController

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new
    @ophtalmo = User.where(ophtalmo: true).order("RANDOM()").first
    @exam = Exam.find(params[:exam_id])
    @prescription.exam = @exam
    @prescription.ophtalmo = @ophtalmo
    @prescription.save
    redirect_to user_path(current_user)
  end

  def show

  end

end
