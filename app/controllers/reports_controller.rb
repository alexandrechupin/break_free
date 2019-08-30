class ReportsController < ApplicationController
  before_action :set_incident, only: [:show, :create]
  before_action :set_report, only: :show

  def create
      @report = Report.new
      @report.incident = @incident
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

  private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def set_report
    @report = Report.find(params[:id])
    authorize @report
  end

  def report_params
    params.require(:report).permit(:incident, :photo, :photo_cache)
  end
end
