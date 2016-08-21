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

def add_resume_info_to_user
  user = create_user
end

def create_company
  industry = Industry.create!(name: "Tech")
  industry.companies.create!(
    name: "Inspirato",
    description: "Great company",
    location: "CO",
    status: 2,
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904"
  )
end

def create_three_companies
  create_company
  industry2 = Industry.create!(name: "Advertising")
  industry2.companies.create!(
    name: "Integer",
    description: "Nice company",
    location: "CO",
    status: 2,
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904"
  )
  industry3 = Industry.create!(name: "Finance")
  industry3.companies.create!(
    name: "TD Ameritrade",
    description: "Rich company",
    location: "FL",
    status: 2,
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904"
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

def create_job_application
  job = create_job
  job.job_applications.create!(
    summary: "I'm the perfect candidate for this job.",
    education: "Turing",
    experience: "The pivot project",
    status: 0
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
  Company.first.jobs.create!(
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
