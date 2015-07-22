require 'rails_helper'

describe AuthorsController do
  describe 'POST #create' do
    context 'when proper parameters' do
      let(:params) { attributes_for(:author) }

      it 'saves new author' do
        expect { post :create, author: params }.to change(Author, :count).by(1)
      end

      it 'redirects to author/:id view' do
        post :create, author: params
        expect(response).to redirect_to "/authors/#{Author.last.id}"
      end
    end

    context 'when improper parameters' do
      let(:params) { { name: nil, surname: nil } }

      it 'does not save author' do
        expect { post :create, author: params }.not_to change(Author, :count)
      end

      it 'renders :new view' do
        post :create, author: params
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before { put :update, id: author, author: params }
    let(:author) { create(:author) }

    context 'when proper parameters' do
      let(:params) { { name: 'John', surname: 'Spencer' } }

      it 'updates author' do
        author.reload
        expect(author.name).to eq 'John'
        expect(author.surname).to eq 'Spencer'
      end

      it 'redirects to authors/:id' do
        expect(response).to redirect_to "/authors/#{Author.last.id}"
      end
    end

    context 'when improper parameters' do
      let(:params) { { name: nil, surname: nil } }
      let(:author) { create(:author, name: 'John', surname: 'Spencer') }

      it 'does not update author' do
        author.reload
        expect(author.name).to eq 'John'
        expect(author.surname).to eq 'Spencer'
      end

      it 'renders :edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:author) { create(:author, name: 'parara') }

    it 'deletes author' do
      author
      expect { delete :destroy, id: author }.to change(Author, :count).by(-1)
    end

    context 'when book has single author' do
      let(:book) { create(:book) }

      it 'deletes book' do
        author.books << book
        expect { delete :destroy, id: author }.to change(Book, :count).by(-1)
      end
    end
  end
end
