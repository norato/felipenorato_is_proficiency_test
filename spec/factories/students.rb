FactoryGirl.define do
  factory :student do
    name "MyString"
    register_number "MyString"
    status 1
  end
  factory :invalid_student, parent: :student do |f|
    f.name nil
    f.register_number nil
    f.status nil
  end

end
