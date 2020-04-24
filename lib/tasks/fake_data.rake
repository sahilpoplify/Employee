task :fake_data => :environment do

        20.times do
            name = Faker::Name.unique.name
            city_id = rand(1..3)
            manager_id = rand(1..20)
            Employee.create(name: name, manager_id: manager_id, city_id: city_id)
        end

end


