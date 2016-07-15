require 'rails_helper'

RSpec.describe Classroom, type: :model do

  context 'Validations' do
    it { is_expected.to validate_presence_of :entry_at }
    it { is_expected.to validate_presence_of :student_id }
    it { is_expected.to validate_presence_of :course_id }
  end

  context 'Relationships' do
    it { should belong_to(:course) }
    it { should belong_to(:student) }
  end

end
