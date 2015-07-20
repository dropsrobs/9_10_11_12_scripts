require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is invalid without attributes' do
    expect(FactoryGirl.build(:author, name: nil, surname: nil)).not_to be_valid
  end

  it 'is invalid without surname' do
    expect(FactoryGirl.build(:author, surname: nil)).not_to be_valid
  end

  it 'is invalid without name' do
    expect(FactoryGirl.build(:author, name: nil)).not_to be_valid
  end

  it 'is valid with name and surname' do
    expect(FactoryGirl.build(:author)).to be_valid
  end

  describe '#name_with_initial' do
    let(:author) { FactoryGirl.create(:author, name: 'Mike', surname: 'Parks') }
    it 'returns author name and surname' do
      expect(author.name_with_initial).to eq('Mike Parks')
    end
  end
end
