require "csv"

class ImportsController < ApplicationController
  before_action :set_account, only: %i[ index create ]
  before_action :set_import, only: %i[ show destroy ]

  def index
    @import = @account.imports.build
    # reload avoids the newly built import from showing up in the list
    # i'm sure there's a better way to do this
    @imports = @account.imports.reload
  end

  def show
    @csv_data = CSV.parse(@import.file.download, headers: true)
  end

  def create
    @import = @account.imports.new(import_params)

    if @import.save
      redirect_to @import, notice: "Import was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @import.destroy!

    redirect_to @import.account, status: :see_other, notice: "Import was successfully destroyed."
  end

  private

    def set_account
      @account = Account.find(params.expect(:account_id))
    end

    def set_import
      @import = Import.find(params.expect(:id))
    end

    def import_params
      params.expect(import: [ :account_id, :file ])
    end
end
