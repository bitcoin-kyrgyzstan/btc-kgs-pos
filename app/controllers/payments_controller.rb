class PaymentsController < ApplicationController

  before_action :authenticate_organization!

  def new
    @payment = Payment.new
  end

  def create
    @payment = current_organization.payments.create! payment_params
    redirect_to @payment
  end

  def show
    @payment = current_organization.payments.find params[:id]
  end

  private

    def payment_params
      params.require(:payment).permit :amount
    end

end