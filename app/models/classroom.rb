class Classroom < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates_presence_of :entry_at, :student_id, :course_id
  validates_associated :course, :student
end
