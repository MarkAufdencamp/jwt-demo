class AccountsController < ApplicationController
  before_action :set_domain
  before_action :set_account, only: %i[ show update destroy ]

  # GET /domains/:domain_id/accounts
  def index
    render json: @domain.accounts
  end

  # GET /domains/:domain_id/accounts/:id
  def show
    render json: @account
  end

  # POST /domains/:domain_id/accounts
  def create
    @account = @domain.accounts.build(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /domains/:domain_id/accounts/:id
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /domains/:domain_id/accounts/:id
  def destroy
    @account.destroy!
  end

  private

  def set_domain
    @domain = @current_user.domains.find(params[:domain_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Domain not found" }, status: :not_found
  end

  def set_account
    @account = @domain.accounts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Account not found" }, status: :not_found
  end

  def account_params
    params.require(:account).permit(:username, :email, :password, :password_confirmation)
  end
end
