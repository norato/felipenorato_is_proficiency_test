FactoryGirl.define do
  factory :student do
    name "MyString"
    register_name "MyString"
    status 1
  end
  factory :invalid_student, parent: :student do |f|
    f.name nil
    f.register_name nil
    f.status nil
  end

end
