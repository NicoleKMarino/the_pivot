class Seed
  def self.start
   create_industries
   create_companies_status_online
   generate_jobs
   create_users
   create_roles
   create_user_roles
  end

  def self.create_roles
    Role.create!(name: "registered_user")
    Role.create!(name: "employer")
    Role.create!(name: "platform_admin")
    Role.create!(name: "guest_user")
  end


  def self.create_users
    User.create!(username: "Test",
                 email: "deborahleehamel@gmail.com",
                 password: "password",
                 first_name: "Deb",
                 last_name: "Hamel",
                 address: "2122 Concord Lane",
                 city: "Denver",
                 state: "CO",
                 zip_code: 80215,
                 )

   User.create!(username: "Employer",
                email: "nicolekmarina@hotmail.com",
                password: "password",
                first_name: "Nicole",
                last_name: "Marina",
                address: "2122 Concord Lane",
                city: "Denver",
                state: "CO",
                zip_code: 80215,
                )


    User.create!(username: "Admin",
                 email: "lanerdoce@aol.com",
                 password: "password",
                 first_name: "Lane",
                 last_name: "Winham",
                 address: "2122 Concord Lane",
                 city: "Denver",
                 state: "CO",
                 zip_code: 80215,
                 )
  end

  def self.create_user_roles
    UserRole.create(user_id:1, role_id:1)
    UserRole.create(user_id:2, role_id:2)
    UserRole.create(user_id:3, role_id:3)
  end


  def self.create_industries
    Industry.create!(name: "Tech")
    Industry.create!(name: "Advertising")
    Industry.create!(name: 'Finance')
  end

  def self.create_companies_status_online #check how to make sure name is unique with Faker
   20.times do |i|
    industry = Industry.offset(rand(Industry.count)).first
    industry.companies.create!(name: Faker::Company.name, description: Faker::Company.catch_phrase, location: Faker::Address.state, status: 2, img_path: Faker::Company.logo)
   end
  end

  def self.generate_jobs
    30.times do |i|
     company = Company.offset(rand(Company.count)).first
     company.jobs.create!(title: Faker::Company.profession, description: Faker::Lorem.paragraph(2), status: 0, salary: ["$40,000-$60,000", "$60,000-$80,000", "$80,000-$100,000"].sample)
    end
  end
end

Seed.start