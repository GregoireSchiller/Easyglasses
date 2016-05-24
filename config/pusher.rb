require 'pusher'

pusher_client = Pusher::Client.new(
  app_id: '210006',
  key: '4859a4e7eca3562d2c5f',
  secret: '9c7596d299cfa5675f4c',
  cluster: 'eu',
  encrypted: true
)

pusher_client.trigger('test_channel', 'my_event', {
  message: 'hello world'
})
