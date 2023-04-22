class IntegrationsController < ApplicationController
  # GET /integrations
  def index
    # TODO: get pagy to work with array instead of active record relation
    # @pagy, @integrations = pagy(current_account.integrations)
    @integrations = current_account.integrations
  end

  # GET /integrations/new
  def new; end
end
