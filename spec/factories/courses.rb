FactoryGirl.define do
  factory :course do
    name "MyString"
    description "MyString"
    status 1
  end
  factory :invalid_course, parent: :course do |f|
    f.name nil
    f.description nil
    f.status nil
  end
end
