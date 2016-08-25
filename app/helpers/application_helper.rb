module ApplicationHelper

  def platform_admin
    current_user != nil && current_user.platform_admin?
  end

  def employer
    current_user.employer?
  end

  def job_format(application)
    application.job.title.upcase
  end

  def job_capitalize(job)
    job.title.capitalize
  end

  def company_format(company)
    company.name.capitalize
  end

  def company_application_format(application)
    application.job.company.name.upcase
  end
end
