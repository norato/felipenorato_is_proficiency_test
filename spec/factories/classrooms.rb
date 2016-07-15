FactoryGirl.define do
  factory :classroom do
    course
    student
    entry_at Time.now
  end
end
