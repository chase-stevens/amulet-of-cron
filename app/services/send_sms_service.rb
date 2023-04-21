class SendSmsService
  TWILIO_PHONE_NUMBER = ENV["TWILIO_PHONE_NUMBER"]

  def initialize(phone_number, message)
    @phone_number = phone_number
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create(
      from: TWILIO_PHONE_NUMBER,
      to: @phone_number,
      body: @message
    )
  rescue
    false
  end
end
