class SendEmailService
  FROM_EMAIL = ENV["FROM_EMAIL_ADDRESS"]

  def initialize(email_recipient, body)
    @email_recipient = email_recipient
    @body = body
  end

  def call
  # TODO: write email method
    return
  # todo: think about error reporting for failed notifications
  # and failed monitor checks
  rescue
    false
  end
end
