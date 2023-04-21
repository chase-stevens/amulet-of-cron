class SmsIntegrationsController < ApplicationController
  before_action :set_sms_integration, only: [:show, :edit, :update, :destroy]

  # GET /sms_integrations
  def index
    @pagy, @sms_integrations = pagy(current_account.sms_integrations.sort_by_params(params[:sort], sort_direction))
  end

  # GET /sms_integrations/1 or /sms_integrations/1.json
  def show
  end

  # GET /sms_integrations/new
  def new
    @sms_integration = SmsIntegration.new
  end

  # GET /sms_integrations/1/edit
  def edit
  end

  # POST /sms_integrations or /sms_integrations.json
  def create
    @sms_integration = current_account.sms_integrations.new(sms_integration_params)

    respond_to do |format|
      if @sms_integration.save
        format.html { redirect_to @sms_integration, notice: "Sms integration was successfully created." }
        format.json { render :show, status: :created, location: @sms_integration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sms_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms_integrations/1 or /sms_integrations/1.json
  def update
    respond_to do |format|
      if @sms_integration.update(sms_integration_params)
        format.html { redirect_to @sms_integration, notice: "Sms integration was successfully updated." }
        format.json { render :show, status: :ok, location: @sms_integration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sms_integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_integrations/1 or /sms_integrations/1.json
  def destroy
    @sms_integration.destroy
    respond_to do |format|
      format.html { redirect_to sms_integrations_url, status: :see_other, notice: "Sms integration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sms_integration
    @sms_integration = SmsIntegration.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @sms_integration
  rescue ActiveRecord::RecordNotFound
    redirect_to sms_integrations_path
  end

  # Only allow a list of trusted parameters through.
  def sms_integration_params
    params.require(:sms_integration).permit(:phone_number)

    # Uncomment to use Pundit permitted attributes
    # params.require(:sms_integration).permit(policy(@sms_integration).permitted_attributes)
  end
end
