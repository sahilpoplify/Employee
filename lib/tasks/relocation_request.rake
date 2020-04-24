
task :relocation_request => :environment do


   # a = Employee.all.count/2
   
    10.times do 
        
       sahil  = Employee.find(rand(1..20))
       sahil.willing = true
        sahil.save
        

       # name = Faker::Name.unique.name
        # city_id = rand(1..3)
        # manager_id = rand(1..20)
        # Employee.create(name: name, manager_id: manager_id, city_id: city_id)
    end

end