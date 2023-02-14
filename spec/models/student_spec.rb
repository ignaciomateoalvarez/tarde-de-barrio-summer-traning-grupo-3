require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }
  describe 'Validations' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:lastname) }
      it { is_expected.to validate_presence_of(:birthday) }
      it { is_expected.to validate_presence_of(:address) }
      it { is_expected.to validate_presence_of(:school_grade) }
      it { is_expected.to validate_presence_of(:currently_studying) }
    end

    context 'Numericaly' do
    end

    describe 'Format' do
      it { is_expected.not_to allow_value('nicolas123').for(:name) }
      it { is_expected.to allow_value('nicolas').for(:name) }
      it { is_expected.not_to allow_value('gar123').for(:lastname) }
      it { is_expected.to allow_value('garci').for(:lastname) }
      it { is_expected.not_to allow_value('gar%').for(:lastname) }
    end

    describe 'Factory' do
      it { expect(create(:student)).to be_persisted }
    end
  end
end
