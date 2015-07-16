require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is not valid without edition' do
    expect(FactoryGirl.build(:book, edition: nil)).not_to be_valid
  end

  it 'is not valid without title' do
    expect(FactoryGirl.build(:book, title: nil)).not_to be_valid
  end

  it 'is not valid when edition is non-numeric' do
    expect(FactoryGirl.build(:book, edition: 't')).not_to be_valid
  end

  it 'is valid with title and edition numeric' do
    expect(FactoryGirl.create(:book)).to be_valid
  end

  describe '#name_with_initial' do
    let(:book) { FactoryGirl.create(:book, title: 'Fantasy Book', edition: 2) }
    it 'returns book title and edition' do
      expect(book.name_with_initial).to eq('Fantasy Book, 2. edition')
    end
  end
end
