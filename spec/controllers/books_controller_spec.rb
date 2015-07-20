require 'rails_helper'

describe BooksController do
  describe 'POST #create' do
    context 'when proper parameters' do
      let(:params) { attributes_for(:book) }

      it 'saves new book' do
        expect { post :create, book: params }.to change(Book, :count).by(1)
      end

      it 'redirects to book/:id view' do
        post :create, book: params
        expect(response).to redirect_to authors_path
      end
    end

    context 'when improper parameters' do
      let(:params) { { title: nil, edition: nil } }

      it 'does not save book' do
        expect { post :create, book: params }.not_to change(Book, :count)
      end

      it 'renders :new view' do
        post :create, book: params
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let(:book) { create(:book) }
    before { put :update, id: book, book: params }

    context 'when proper parameters' do
      let(:params) { attributes_for(:book, title: 'Washing Machines tutorial', edition: 1) }

      it 'updates author' do
        book.reload
        expect(book.title).to eq 'Washing Machines tutorial'
        expect(book.edition).to eq 1
      end

      it 'redirects to book/:id' do
        expect(response).to redirect_to "/books/#{Book.last.id}"
      end
    end

    context 'when improper parameters' do
      let(:params) { { title: :nil, edition: :nil } }
      let(:book) { create(:book, title: 'Washing Machines tutorial', edition: 2) }

      it 'does not update book' do
        book.reload
        expect(book.title).to eq 'Washing Machines tutorial'
        expect(book.edition).to eq 2
      end

      it 'renders :edit view' do
        expect(response).to render_template :edit
      end
    end
  end
end
