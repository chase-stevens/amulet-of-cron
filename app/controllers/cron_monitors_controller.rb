class CronMonitorsController < ApplicationController
  before_action :set_cron_monitor, only: [:show, :edit, :update, :destroy]

  # GET /cron_monitors
  def index
    @cron_monitors = current_account.cron_monitors.in_order_of(:aasm_state, CronMonitor::STATE_SORT_ORDER).all
    @pagy, @cron_monitors = pagy(@cron_monitors.sort_by_params(params[:sort], sort_direction))
  end

  # GET /cron_monitors/1 or /cron_monitors/1.json
  def show
  end

  # GET /cron_monitors/new
  def new
    @cron_monitor = current_account.cron_monitors.new
  end

  # GET /cron_monitors/1/edit
  def edit
  end

  # POST /cron_monitors or /cron_monitors.json
  def create
    @cron_monitor = current_account.cron_monitors.new(cron_monitor_params)

    respond_to do |format|
      if @cron_monitor.save
        format.html { redirect_to @cron_monitor, notice: "Cron monitor was successfully created." }
        format.json { render :show, status: :created, location: @cron_monitor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cron_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cron_monitors/1 or /cron_monitors/1.json
  def update
    respond_to do |format|
      if @cron_monitor.update(cron_monitor_params)
        format.html { redirect_to @cron_monitor, notice: "Cron monitor was successfully updated." }
        format.json { render :show, status: :ok, location: @cron_monitor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cron_monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cron_monitors/1 or /cron_monitors/1.json
  def destroy
    @cron_monitor.destroy
    respond_to do |format|
      format.html { redirect_to cron_monitors_url, status: :see_other, notice: "Cron monitor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /1/check_in
  def check_in
    @cron_monitor = CronMonitor.find(params[:id])
    check_in_service = CheckInCronMonitor.new(@cron_monitor).call

    if check_in_service
      render plain: 'OK', status: :ok
    else
      render plain: 'Something went wrong!', status: :bad_request
    end
  end

  private

  def set_cron_monitor
    @cron_monitor = current_account.cron_monitors.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to cron_monitors_path
  end

  def cron_monitor_params
    params.require(:cron_monitor).permit(:title, :interval, :notes)
  end
end
