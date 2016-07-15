class Student < ActiveRecord::Base
  extend EnumerateIt

  validates_presence_of :name, :status, :register_name
  has_enumeration_for :status, with: Status

end
