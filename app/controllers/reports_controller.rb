class ReportsController < ApplicationController
  before_action :set_incident, only: [:show, :create, :create_complaint, :report_complaint, :update_report, :send_anonymous_report]
  before_action :set_report, only: [:show, :report_complaint, :update_report, :send_anonymous_report]

  def create
    @report = Report.new
    @report.incident = @incident
    @report.report_type = "anonymous report"
    @report.save
    authorize @report
    redirect_to incident_report_path(@incident, @report)
  end

  def show
    content = ApplicationController.render(
      formats: :html,
      template: "reports/report_pdf.html.erb",
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

  def create_complaint
    @report = Report.new
    @report.incident = @incident
    @report.report_type = "complaint"
    @report.save
    authorize @report
    redirect_to report_complaint_incident_report_path(@incident, @report)
  end

  def report_complaint
        @user = current_user

        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "Report No. #{@report.id}",
                page_size: 'A4',
                template: "reports/complaint_pdf.html.erb",
                encoding: 'utf-8',
                layout: "pdf.html",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
            end
        end
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
    params.require(:report).permit(:incident, :photo, :photo_cache, :recipient_email)
  end
end
