class Seed
  def self.start
   create_industries
   create_roles
   create_registered_users
   create_employers
   create_platform_admin
   create_companies_status_online
   generate_jobs
  end

  def self.create_roles
    Role.create!(name: "registered_user")
    Role.create!(name: "employer")
    Role.create!(name: "platform_admin")
  end

  def self.create_registered_users
    100.times do |i|
      User.create!(
        username: "User#{i}",
        email: "registered_user#{i}@hotmail.com",
        password: "password",
        first_name: "Happy",
        last_name: "Gilmore",
        address: "2122 Concord Lane",
        city: "Denver",
        state: "CO",
        zip_code: 80215
      )
    end
    registered_user_roles
  end

  def self.registered_user_roles
    100.times do |i|
      UserRole.create!(
        user_id: i + 1,
        role_id: 1
      )
    end
  end

  def self.employer_user_roles
    20.times do |i|
      UserRole.create!(
        user_id: 100 + i + 1,
        role_id: 2
      )
    end
  end

  def self.platform_admin_user_roles
    UserRole.create!(
      user_id: 121,
      role_id: 3
    )
  end

  def self.create_employers
    20.times do |i|
      User.create!(
        username: "Employer#{i}",
        email: "employer#{i}@hotmail.com",
        password: "password",
        first_name: "Happy",
        last_name: "Gilmore",
        address: "2122 Concord Lane",
        city: "Denver",
        state: "CO",
        zip_code: 80215
      )
    end
    employer_user_roles
  end

  def self.create_platform_admin
    User.create!(
      username: "Platform_admin",
      email: "platform_admin@hotmail.com",
      password: "password",
      first_name: "Happy",
      last_name: "Gilmore",
      address: "2122 Concord Lane",
      city: "Denver",
      state: "CO",
      zip_code: 80215
    )
    platform_admin_user_roles
  end

  def self.create_industries
    Industry.create!(name: "Tech")
    Industry.create!(name: "Advertising")
    Industry.create!(name: 'Finance')
    Industry.create!(name: 'Education')
    Industry.create!(name: 'Healthcare')
    Industry.create!(name: 'Government')
    Industry.create!(name: 'Law')
    Industry.create!(name: 'Entertainment')
    Industry.create!(name: 'Construction')
    Industry.create!(name: 'Hospitality')
  end

  def self.create_companies_status_online
    20.times do |i|
      user = rand(66..121)
      industry = Industry.offset(rand(Industry.count)).first
      industry.companies.create!(
        name: Faker::Company.name,
        description: Faker::Company.catch_phrase,
        location: Faker::Address.state,
        img_path: Faker::Company.logo,
        user_id: user
      )
   end
  end

  def self.generate_jobs
    Industry.all.each do |industry|
      industry.companies.each do |company|
        50.times do |i|
          company.jobs.create!(
            title: Faker::Company.profession,
            description: Faker::Lorem.paragraph(2),
            salary: ["$40,000-$60,000", "$60,000-$80,000", "$80,000-$100,000"].sample)
        end
      end
    end
  end
end

Seed.start
