Course.destroy_all
Student.destroy_all
Classroom.destroy_all

10.times do
  Course.create!(
    name: Faker::Superhero.power,
    status: Status.list.sample,
    description: Faker::Space.agency
  )
  Student.create!(
    name: Faker::Superhero.name,
    status: Status.list.sample,
    register_number: Faker::StarWars.droid
  )
end

10.times do |course|
  5.times do |student|
    Classroom.create!(
      course: Course.all[course],
      student: Student.all[student],
      entry_at: Time.now
    )
  end
end
