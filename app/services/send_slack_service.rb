class SendSlackService

  def initialize(channel, text)
    @channel = channel
    @text = text
  end

  def call
  # TODO: write slack method
  # let's use slack-ruby-client
  # https://github.com/slack-ruby/slack-ruby-client
    return
  # todo: think about error reporting for failed notifications
  # and failed monitor checks
  rescue
    false
  end
end
