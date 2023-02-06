require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:lastname) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe 'Factory' do
    it { expect(create(:user)).to be_valid }
  end

  context 'Factory' do
    it { expect(create(:user)).to be_persisted }
  end
end
