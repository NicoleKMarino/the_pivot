FactoryGirl.define do

  industry_names = [ "Tech", "Advertising", "Finance"]
  salary_ranges = ["$40,000-$60,000", "$60,000-$80,000"]
  locations = ["CO", "NY", "CA"] #use Faker
  #
  # factory :job do
  #   title
  #   description "This is our job description. Come work with us."
  #   salary salary_ranges.sample
  #
  #  # factory :unavailable_job do
  #  #   status 1
  #  # end
  # end
  #
  # factory :company do
  #   before_create do |company|
  #     FactoryGirl.build(:industry, company: company)
  #   end
  #   name { generate(:company_name) }
  #   description "Our company is awesome"
  #   location locations.sample
  #   status 2
  #   img_path "blablabla" #Faker
  # end

  factory :industry do
    name industry_names.sample
  end

  #factory :order do
  #  user
  #  jobs { create_list(:job, 2) }
  #end

  factory :user do
    username
    email
    password 'password'
    first_name 'Joe'
    last_name 'Smith'
    address '123 Anywhere St.'
    city 'AnyTown'
    state 'CA'
    zip_code 99999

    factory :admin do
      role 1
    end
  end

  sequence :username do |n|
    "user_#{n}"
  end

  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :company_name do |n|
    "Company_#{n}"
  end
  sequence :title do |n|
    "job_#{n}"
  end


end
