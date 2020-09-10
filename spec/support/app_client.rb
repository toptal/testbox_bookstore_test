require 'faraday'
require 'json'

class AppClient
  def initialize(url = 'http://bookstore-api:3000')
    @url = url
  end

  def add_book(author, title)
    resp = Faraday.post("#{@url}/books", author: author, title: title)
  end

  def delete_book(id)
    resp = Faraday.delete("#{@url}/books/#{id}")
  end

  def books
    resp = Faraday.get("#{@url}/books")
    JSON.parse(resp.body)
  end
end
