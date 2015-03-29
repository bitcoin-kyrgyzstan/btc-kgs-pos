class PaymentsController < ApplicationController
  before_action :authenticate_organization!

  respond_to :html, :json

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_organization.payments.create! payment_params
    redirect_to @payment
  end

  def show
    @payment = current_organization.payments.find params[:id]
    @payment.refresh_status_from_blockchain!

    respond_with @payment
  end

  private

    def payment_params
      params.require(:payment).permit :amount
    end

end
