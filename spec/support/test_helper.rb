require 'simplecov'
SimpleCov.start 'rails'

# SimpleCov.start do
#   add_group "Model", "app/models"
#   add_group "Controllers", "app/controllers"
#   add_group "Helpers", "app/helpers"
#   add_group "Long files" do |src_file|
#     src_file.lines.count > 100
#   end
#   add_group "Multiple Files", ["app/models", "app/controllers", "app/helpers"] # You can also pass in an array
# end

def create_user
  role = Role.create(name: "registered_user")
  role.users.create!(
    username: "josh",
    email: "josh@aol.com",
    password: "password",
    first_name: "Josh",
    last_name: "Winham",
    address: "2122 Concord Lane",
    city: "Denver",
    state: "CO",
    zip_code: 80215
  )
end

def create_company
  user = User.create!(
    username: "Test",
    email: "nicolekmarina@ssdshotmail.com",
    password: "password",
    first_name: "Nicole",
    last_name: "Marina",
    address: "2122 Concord Lane",
    city: "Denver",
    state: "CO",
    zip_code: 80215
  )
  industry = Industry.create!(name: "Tech")
  industry.companies.create!(
    name: "Inspirato",
    description: "Great company",
    location: "CO",
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
    user_id: user.id
  )
end

def create_two_companies
  create_company
  user = User.create!(
    username: "Test2",
    email: "nicolekrihhhxxxxstenmarina@hotmail.com",
    password: "password",
    first_name: "Nicole",
    last_name: "Marina",
    address: "2122 Concord Lane",
    city: "Denver",
    state: "CO",
    zip_code: 80215
  )
  industry2 = Industry.create!(name: "Advertising")
  industry2.companies.create!(
    name: "Integer",
    description: "Nice company",
    location: "CO",
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
    user_id: user.id
  )
end

def create_three_companies
  create_two_companies
  user = User.create!(
    username: "Test5",
    email: "nicolekrixxxxstfffghhenmarina@hotmail.com",
    password: "password",
    first_name: "Nicole",
    last_name: "Marina",
    address: "2122 Concord Lane",
    city: "Denver",
    state: "CO",
    zip_code: 80215
  )
  industry3 = Industry.create!(name: "Finance")
  industry3.companies.create!(
    name: "TD Ameritrade",
    description: "Rich company",
    location: "FL",
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
    user_id: user.id
  )
end

def create_job
  company = create_company
  company.jobs.create!(
    title: "Software Integration Developer",
    description: "This is an entry level position.",
    status: 0,
    salary: "$40,000-$60,000"
  )
end

def create_two_jobs
  create_two_companies
  Company.first.jobs.create!(
    title: "Software Integration Developer",
    description: "This is an entry level position.",
    status: 0,
    salary: "$40,000-$60,000"
  )
  Company.last.jobs.create!(
    title: "Senior Software Integration Developer",
    description: "This positions requires 5 years of experience.",
    status: 0,
    salary: "$60,000-$80,000"
  )
end

def create_three_jobs
  create_three_companies
  Company.first.jobs.create!(
    title: "Software Integration Developer",
    description: "This is an entry level position.",
    status: 0,
    salary: "$40,000-$60,000"
  )
  Company.second.jobs.create!(
    title: "Senior Software Integration Developer",
    description: "This positions requires 5 years of experience.",
    status: 0,
    salary: "$60,000-$80,000"
  )
  Company.last.jobs.create!(
    title: "Designer",
    description: "This positions requires 3 years of experience.",
    status: 0,
    salary: "$40,000-$60,000"
  )
end

def create_job_application
  job = create_job
  job.job_applications.create!(
    summary: "I'm the perfect candidate for this job.",
    education: "Turing",
    experience: "The pivot project",
    status: 0
  )
end

def create_submitted_job_application
  user = User.create!(
    username: "Test3",
    email: "nicolekmaffffrina@hotmail.com",
    password: "password",
    first_name: "Nicole",
    last_name: "Marina",
    address: "2122 Concord Lane",
    city: "Denver",
    state: "CO",
    zip_code: 80215
  )

  industry = Industry.create!(name: "Advertising")
  company = industry.companies.create!(
    name: "Integer",
    description: "Nice company",
    location: "CO",
    status: 2,
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904",
    user_id: user.id)

  job = company.jobs.create!(
    title: "Designer",
    description: "Experience required",
    status: 0,
    salary: "$60,000-$80,000"
  )
  job.job_applications.create!(
    summary: "I would love to work for this company",
    education: "Self taught",
    experience: "2 years Rails experience",
    status: 1
  )
end


