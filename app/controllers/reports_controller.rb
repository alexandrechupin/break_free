class ReportsController < ApplicationController
  before_action :set_incident, only: :show

  # def show
  #   @report = Report.find(params[:id])
  #   authorize @report

  #   respond_to do |format|
  #       format.html
  #       format.pdf do
  #           render pdf: "Rapport No. #{@report.id}",
  #           page_size: 'A4',
  #           template: "reports/show.html.erb",
  #           layout: "pdf.html",
  #           orientation: "Landscape",
  #           lowquality: true,
  #           zoom: 1,
  #           dpi: 75
  #       end
  #   end
  # end


  def show
    @report = Report.find(params[:id])
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

    Cloudinary::Uploader.upload(file.path, :public_id => "report_page_pdf")

    # respond_to do |format|
    #     format.html
    #     format.pdf do
    #         render pdf: "Report No. #{@report.id}",
    #         page_size: 'A4',
    #         template: "reports/report_pdf.html.erb",
    #         layout: "pdf.html",
    #         orientation: "Landscape",
    #         lowquality: true,
    #         zoom: 1,
    #         dpi: 75
    #     end
    # end
  end

  private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end
end

