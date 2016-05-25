require 'pusher'

class PusherClient
  def self.get
    @client ||= Pusher::Client.new(
      app_id: ENV['pusher_app_id'], # ENV['pusher_app_id']
      key: ENV['pusher_key'],
      secret: ENV['pusher_secret'],
      cluster: 'mt1',
      encrypted: true
    )
  end
end
