class BaseIntegration < ApplicationRecord
  self.abstract_class = true

  def send_message
    raise NotImplementedError
  end

end