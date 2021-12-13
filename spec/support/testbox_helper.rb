require 'json'
require 'testbox/web/client'

class TestboxHelper
  attr_reader :client

  def initialize(url = 'http://testbox:4567')
    @client = Testbox::Web::Client.new(url)
  end

  def db_migrate
    client.execute('exec bookstore-api rails db:migrate')
  end

  def db_reset
    client.execute('exec bookstore-api rails db:reset')
  end

  def feature_flags
    JSON.parse(client.execute('feature_flags bookstore-api')['stdout'])
  end
end
