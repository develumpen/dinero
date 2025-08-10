class CsvImportsController < ApplicationController
  before_action :set_csv_import, only: %i[ show ]

  def index
    @csv_imports = CsvImport.order(created_at: :desc)
  end

  def show
    @csv_headers = []
    @csv_rows = []

    if @csv_import.file.attached?
      csv_data = @csv_import.file.download
      parsed_csv = CSV.parse(csv_data, headers: true)
      @csv_headers = parsed_csv.headers
      @csv_rows = parsed_csv.map(&:fields)
    end
  end

  def new
    @csv_import = CsvImport.new
    @accounts = Account.all.collect { |a| [ a.name, a.id ] }
  end

  def create
    @csv_import = CsvImport.new(csv_import_params)

    if @csv_import.save
      CsvImportSetMetadataJob.perform_later(@csv_import.id)
      redirect_to @csv_import, notice: "Archivo CSV importado con éxito"
    else
      @accounts = Account.all.collect { |a| [ a.name, a.id ] }
      render :new, status: :unprocessable_entity
    end
  end

  private
    def csv_import_params
      params.expect(csv_import: [ :file, :account_id ])
    end

    def set_csv_import
      @csv_import = CsvImport.find(params[:id])
    end
end
