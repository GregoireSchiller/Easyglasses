class PrescriptionsController < ApplicationController

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new
    @ophtalmo = User.where(ophtalmo: true).first
    @exam = Exam.find(params[:exam_id])
    @prescription.exam = @exam
    @prescription.ophtalmo = @ophtalmo
    @prescription.save
    redirect_to desktop_results_exam_path(@exam)
  end

  def edit
    @exam = Exam.find(params[:exam_id])
    @prescription = @exam.prescription
  end

  def update
    @exam = Exam.find(params[:exam_id])
    @prescription = @exam.prescription
    @prescription.status = "Sent"
    @prescription.save
    redirect_to desktop_results_exam_path(@exam)
  end
end
