require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :register_number }
  end
  context '#status' do
    let!(:student_active) { create :student }
    let!(:student_inactive) { create :student, status: 0 }
    it { student_active.status_humanize.should eq 'Ativo' }
    it { student_inactive.status_humanize.should eq 'Inativo' }
  end
end
