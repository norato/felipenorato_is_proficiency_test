class Status < EnumerateIt::Base

  associate_values(
    inactive: 0,
    active: 1
  )

end
