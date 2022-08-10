require_relative './support/app_client'
require_relative './support/testbox_helper'

RSpec.describe 'Bookstore API' do
  before(:all) { TestboxHelper.new.db_migrate }
  before(:each) { TestboxHelper.new.db_reset }

  it 'has two books at the start' do
    expect(AppClient.new.books.count).to eq 2
  end

  it 'adds a book' do
    client = AppClient.new
    client.add_book('Mihail Bulgakov', 'Master and Margarita')
    expect(client.books.count).to eq 3
  end

  it 'removes a book' do
    client = AppClient.new
    client.delete_book(1)
    expect(client.books.count).to eq 1
  end

  describe 'Book title' do
    it 'Should be upper case', skip: !feature_flags['bookstore-api']['upcase_titles'] do
      expect(AppClient.new.books.first['title']).to eq('MORFIN')
    end

    it 'Should be regular case', skip: feature_flags['bookstore-api']['upcase_titles'] do
      expect(AppClient.new.books.first['title']).to eq('Morfina')
    end
  end
end
