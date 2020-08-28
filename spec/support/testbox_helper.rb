require 'json'
require 'testbox/web/client'

class TestboxHelper
  attr_reader :client

  def initialize(url = 'http://testbox:4567')
    @client = Testbox::Web::Client.new(url)
  end

  def db_migrate
    client.execute(components: ['bookstore-api'], command: 'rails db:migrate')
  end

  def db_reset
    client.execute(components: ['bookstore-api'], command: 'rails db:reset')
  end

  def feature_flags
    JSON.parse(client.execute(components: ['bookstore-api'], action: 'feature_flags')['stdout'])
  end
end
