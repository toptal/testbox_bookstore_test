require 'faraday'

class TestboxHelper
  def initialize(url = 'http://testbox:4567/exec')
    @url = url
  end

  def db_migrate
    resp = Faraday.post(@url, service: 'bookstore_api', command: 'rails db:migrate')
    resp.body
  end

  def db_reset
    resp = Faraday.post(@url, service: 'bookstore_api', command: 'rails db:reset')
    resp.body
  end
end
