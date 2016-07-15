class Student < ActiveRecord::Base
  extend EnumerateIt

  validates_presence_of :name, :status, :register_number
  has_enumeration_for :status, with: Status

end
