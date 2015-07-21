require 'rails_helper'

describe Book, type: :request do
  describe 'Show book API' do
    let(:book) { create(:book) }

    context 'when proper id' do
      before { get "/books/api/#{book.id}.json" }
      it 'returns 200 success code' do
        expect(response).to be_success
      end

      it 'returns data of book' do
        json = JSON.parse(response.body)
        expect(json['title']).to eq(book.title)
        expect(json['edition']).to eq(book.edition)
      end
    end

    context 'when improper id' do
      before { get '/books/100.json' }

      it 'returns 400 error code' do
        expect(response).not_to be_success
      end

      it 'does not data of book' do
        json = JSON.parse(response.body)
        expect(json['title']).not_to eq(book.title)
        expect(json['edition']).not_to eq(book.edition)
      end
    end
  end

  describe 'List books API' do
    before do
      create_list(:book, 10)
      get '/books/api/list.json'
    end

    it 'return 200 success code' do
      expect(response).to be_success
    end

    it 'returns data of all books' do
      json = JSON.parse(response.body)
      expect(json.count).to eq(10)
    end
  end

  describe 'Remove book API' do
    let(:book) { create(:book) }

    context 'when proper id' do
      it 'return 200 success code' do
        delete "/books/api/#{book.id}.json"
        expect(response).to be_success
      end
    end

    context 'when improper id' do
      it 'returns 400 error code' do
        delete '/books/api/100.json'
        expect(response).not_to be_success
      end
    end
  end
end
