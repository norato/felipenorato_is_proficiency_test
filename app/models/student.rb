class Student < ActiveRecord::Base
  validates_presence_of :name, :status, :register_name
end
