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

def create_job
  company = create_company
  company.jobs.create!(
    title: "Software Integration Developer",
    description: "This is an entry level position.",
    status: 0,
    salary: "$40,000-$60,000"
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
    location: "CO",
    status: 2,
    img_path: "http://kpcbweb2.s3.amazonaws.com/companies/422/logo/original/Inspirato_logotype_K_-%C2%AB.jpg?1339101904"
  )
end