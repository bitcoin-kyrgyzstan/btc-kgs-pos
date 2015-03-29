class PaymentsController < ApplicationController

  before_action :authenticate_organization!

  def new
  end

end