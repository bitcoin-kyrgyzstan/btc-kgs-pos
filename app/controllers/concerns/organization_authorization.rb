module OrganizationAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :remember_organization

    helper_method :current_organization, :organization_authenticated?
  end

  def current_organization
    @current_organization ||= Organization.find_by id: session[:organization_id]
  end

  def remember_organization
    return unless params[:token]

    @current_organization = Organization.find_by token: params[:token]
    session[:organization_id] = @current_organization.id if @current_organization
  end

  def organization_authenticated?
    current_organization.present?
  end

  def authenticate_organization!
    unauthorized! unless organization_authenticated?
  end

  def unauthorized!
    respond_to do |format|
      format.html { redirect_to :root, flash: { error: t("errors.unauthorized") } }
      format.json { render json: { error: t("errors.unauthorized") }, status: 401 }
    end
  end

end