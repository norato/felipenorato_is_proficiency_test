require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_presence_of :description }
  end
  context '#status' do
    let!(:course_active) { create :course }
    let!(:course_inactive) { create :course, status: 0 }
    it { course_active.status_humanize.should eq 'Ativo' }
    it { course_inactive.status_humanize.should eq 'Inativo' }
  end
end
