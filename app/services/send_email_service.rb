class SendEmailService
  FROM_EMAIL = ENV["FROM_EMAIL_ADDRESS"]

  def initialize(email_recipient, subject_line, body)
    @email_recipient = email_recipient
    @subject_line = subject_line
    @body = body
  end

  def call
    from = SendGrid::Email.new(email: FROM_EMAIL)
    to = SendGrid::Email.new(email: @email_recipient)
    subject = @subject_line
    content = SendGrid::Content.new(type: 'text/plain', value: @body)

    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
  # todo: think about error reporting for failed notifications
  # and failed monitor checks
  rescue
    false
  end
end
