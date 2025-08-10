class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: "Cuenta añadida con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: "Cuenta editada con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy!

    redirect_to accounts_path
  end

  private
    def account_params
      params.expect(account: [ :name, :description ])
    end

    def set_account
      @account = Account.find(params[:id])
    end
end
