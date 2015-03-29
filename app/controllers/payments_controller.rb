class PaymentsController < ApplicationController
  before_action :authenticate_organization!

  def new
  end

  def show
    payment = Payment.find(params[:id])
    payment.refresh_status_from_blockchain!
    render payment
  end
end
