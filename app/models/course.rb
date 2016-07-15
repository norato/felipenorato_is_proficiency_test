class Course < ActiveRecord::Base
  extend EnumerateIt

  validates_presence_of :name, :status, :description
  has_enumeration_for :status, with: Status

end
