require 'rails_helper'

describe BooksController, type: :controller do
  describe 'Show book API' do
    let(:book) { create(:book) }

    context 'when proper id' do
      before { get :show, id: book.id, format: :json }

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
      before { get :show, id: 100 }

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
      get :index, format: :json
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
        delete :destroy, id: "#{book.id}", format: :json
        expect(response).to be_success
      end
    end

    context 'when improper id' do
      it 'returns 400 error code' do
        delete :destroy, id: '100', format: :json
        expect(response).not_to be_success
      end
    end
  end
end
