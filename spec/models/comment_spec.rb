require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }
  describe 'Validations' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:body) }
    end
    
    describe 'Format' do
      it { is_expected.not_to allow_value('        ').for(:body) }
      it { is_expected.to allow_value('pepito12345@@+').for(:body) }
    end
  end
end
