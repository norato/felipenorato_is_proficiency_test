Course.destroy_all
Student.destroy_all

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
