class DoodadsController < ApplicationController
  before_action :set_doodad, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /doodads
  def index
    @pagy, @doodads = pagy(current_account.doodads.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @doodads
  end

  # GET /doodads/1 or /doodads/1.json
  def show
  end

  # GET /doodads/new
  def new
    @doodad = current_account.doodads.new

    # Uncomment to authorize with Pundit
    # authorize @doodad
  end

  # GET /doodads/1/edit
  def edit
  end

  # POST /doodads or /doodads.json
  def create
    @doodad = current_account.doodads.new(doodad_params)

    # Uncomment to authorize with Pundit
    # authorize @doodad

    respond_to do |format|
      if @doodad.save
        format.html { redirect_to @doodad, notice: "Doodad was successfully created." }
        format.json { render :show, status: :created, location: @doodad }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doodad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doodads/1 or /doodads/1.json
  def update
    respond_to do |format|
      if @doodad.update(doodad_params)
        format.html { redirect_to @doodad, notice: "Doodad was successfully updated." }
        format.json { render :show, status: :ok, location: @doodad }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doodad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doodads/1 or /doodads/1.json
  def destroy
    @doodad.destroy
    respond_to do |format|
      format.html { redirect_to doodads_url, status: :see_other, notice: "Doodad was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_doodad
    @doodad = current_account.doodads.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @doodad
  rescue ActiveRecord::RecordNotFound
    redirect_to doodads_path
  end

  # Only allow a list of trusted parameters through.
  def doodad_params
    params.require(:doodad).permit(:title, :url)

    # Uncomment to use Pundit permitted attributes
    # params.require(:doodad).permit(policy(@doodad).permitted_attributes)
  end
end
