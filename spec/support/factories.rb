FactoryGirl.define do
  factory :job do
    title
    description "This is a job. Come work here."
    salary "10,000-60,000"
    company
    factory :unavailable_job do
      status 1
    end
  end

  factory :company do
    name { generate(:company_name) }
  end

  # factory :industry do
  #   name { generate(:industry_name) }
  # end

  factory :order do
    user
    jobs { create_list(:job, 2) }
  end

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

  sequence :name do |n|
    "Industry_#{n}"
  end


  sequence :company_name do |n|
    "Company_#{n}"
  end


  sequence :title do |n|
    "job_#{n}"
  end


end
