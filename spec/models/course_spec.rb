require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :description }
  end
end
