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
    respond_to do |format|
      format.html { redirect_to desktop_results_exam_path(@exam) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
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
    respond_to do |format|
      format.html { redirect_to desktop_results_exam_path(@exam) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
