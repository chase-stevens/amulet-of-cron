class EmailIntegrationsController < ApplicationController
  before_action :set_email_integration, only: [:show, :edit, :update, :destroy]

  # GET /email_integrations
  def index
    # @pagy, @email_integrations = pagy(current_account.email_integrations.sort_by_params(params[:sort], sort_direction))
    redirect_to integrations_path
  end

  # GET /email_integrations/1 or /email_integrations/1.json
  def show; end

  # GET /email_integrations/new
  def new
    @email_integration = EmailIntegration.new
  end

  # POST /email_integrations or /email_integrations.json
  def create
    @email_integration = current_account.email_integrations.new(email_integration_params)

    respond_to do |format|
      if @email_integration.save
        format.html { redirect_to integrations_url, notice: "Email integration was successfully created." }
        format.json { render :show, status: :created, location: integrations_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_integrations/1 or /email_integrations/1.json
  def destroy
    @email_integration.destroy
    respond_to do |format|
      format.html { redirect_to integrations_url, status: :see_other, notice: "Email integration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_email_integration
    @email_integration = current_account.email_integrations.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @email_integration
  rescue ActiveRecord::RecordNotFound
    redirect_to email_integrations_path
  end

  # Only allow a list of trusted parameters through.
  def email_integration_params
    params.require(:email_integration).permit(:email)

    # Uncomment to use Pundit permitted attributes
    # params.require(:email_integration).permit(policy(@email_integration).permitted_attributes)
  end
end
