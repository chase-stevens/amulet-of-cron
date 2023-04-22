class SlackIntegrationsController < ApplicationController
  before_action :set_slack_integration, only: [:show, :edit, :update, :destroy]

  # GET /slack_integrations
  def index
    # @pagy, @slack_integrations = pagy(current_account.slack_integrations.sort_by_params(params[:sort], sort_direction))
    redirect_to integrations_path
  end

  # GET /slack_integrations/1 or /slack_integrations/1.json
  def show; end

  # GET /slack_integrations/new
  def new
    @slack_integration = SlackIntegration.new
  end

  # POST /slack_integrations or /slack_integrations.json
  def create
    @slack_integration = current_account.slack_integrations.new(slack_integration_params)

    respond_to do |format|
      if @slack_integration.save
        format.html { redirect_to integrations_url, notice: "Slack integration was successfully created." }
        format.json { render :show, status: :created, location: integrations_url }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slack_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slack_integrations/1 or /slack_integrations/1.json
  def update
    respond_to do |format|
      if @slack_integration.update(slack_integration_params)
        format.html { redirect_to @slack_integration, notice: "Slack integration was successfully updated." }
        format.json { render :show, status: :ok, location: @slack_integration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @slack_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slack_integrations/1 or /slack_integrations/1.json
  def destroy
    @slack_integration.destroy
    respond_to do |format|
      format.html { redirect_to integrations_url, status: :see_other, notice: "Slack integration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_slack_integration
    @slack_integration = current_account.slack_integrations.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @slack_integration
  rescue ActiveRecord::RecordNotFound
    redirect_to slack_integrations_path
  end

  # Only allow a list of trusted parameters through.
  def slack_integration_params
    params.require(:slack_integration).permit(:channel)

    # Uncomment to use Pundit permitted attributes
    # params.require(:slack_integration).permit(policy(@slack_integration).permitted_attributes)
  end
end
