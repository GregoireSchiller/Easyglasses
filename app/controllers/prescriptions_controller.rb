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
    @prescription.ophtalmo_score_left = @exam.score_left
    @prescription.ophtalmo_score_right = @exam.score_right
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
    @prescription.ophtalmo_score_left = params[:prescription][:ophtalmo_score_left]
    @prescription.ophtalmo_score_right = params[:prescription][:ophtalmo_score_right]
    @prescription.description = params[:prescription][:description]
    @prescription.save
    PrescriptionMailer.prescription(@prescription.patient).deliver_now
    respond_to do |format|
      format.html { redirect_to desktop_results_exam_path(@exam) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end
end
