class NonprofitsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_incident, only: [:index, :get_content_type, :create, :show]
  before_action :set_report, only: [:show, :update_report, :send_anonymous_report]

  def index
    authorize @incident, :show?
    @nonprofits = @incident.motives.map do |m|
      m.non_profits
    end.flatten.uniq
  end

  def create
    @report = Report.new
    @report.incident = @incident
    @report.report_type = "anonymous report"
    @report.save
    authorize @report
    redirect_to incident_nonprofits_path(@incident, @report)
  end

  def show
    content = ApplicationController.render(
      formats: :html,
      template: "nonprofits/nonprofits_pdf.html.erb",
      encoding: 'utf-8',
      layout: 'pdf.html',
      page_size: 'A4',
      assigns: { report: @report }
    )
    pdf = WickedPdf.new.pdf_from_string(content)
    file = Tempfile.new(["report", ".pdf"])
    File.open(file, 'wb') do |f|
      f << pdf
    end

    @report.photo = "incident#{@incident.id}_report#{@report.id}"

    pdf = Cloudinary::Uploader.upload(file.path, :public_id => @report.photo)
    @report.save
  end

  def update_report
    @report.recipient_email = params[:report][:recipient_email]
    @report.save
  end

  def send_anonymous_report
    UserMailer.with(user: @report.recipient_email).report(@report.id).deliver_now
    redirect_to incident_report_path
  end

private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_report
    @report = Report.find(params[:id])
    authorize @report
  end

  def report_params
    params.require(:report).permit(:incident, :photo, :photo_cache, :recipient_email, :sender_city, :sender_address, :sender_phone_number, :sender_first_name, :sender_last_name)
  end
end
