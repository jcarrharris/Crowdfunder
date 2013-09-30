User.destroy_all
Project.destroy_all

user = User.create!(first_name: "Jon", last_name: "Carr-Harris", email: "joncarrharris@gmail.com", password: "cool")

50.times do |i|
	project1 = user.projects.create!(title: "Project #{i}", teaser: "Teaser text #{i}", description: "description #{i}", goal: 13000)
end
