class ReportsController < ApplicationController
  before_action :set_incident, only: :show

  def show
    if @incident.reports.any?
      @report = Report.find(params[:id])
    else
      @report.create(incident: @incident)
    end
    authorize @report

    content = ApplicationController.render(
      formats: :html,
      template: "reports/report_pdf.html.erb",
      layout: 'pdf.html',
      assigns: { report: @report }
    )
    pdf = WickedPdf.new.pdf_from_string(content)
    file = Tempfile.new(["report", ".pdf"])
    File.open(file, 'wb') do |f|
      f << pdf
    end

    pdf = Cloudinary::Uploader.upload(file.path, :public_id => "incident#{@incident.id}_report#{@report.id}")
    @report.remote_photo_url = pdf["url"]
    @report.save
  end

  private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end
end
