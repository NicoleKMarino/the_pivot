class User < ApplicationRecord
  has_secure_password
  has_many :job_applications
  has_many :saved_jobs
  has_many :jobs, through: :saved_jobs
  has_many :user_roles
  has_many :companies 
  has_many :roles, through: :user_roles
  validates :username, presence: true, uniqueness: true, if: "uid.nil?", on: :create
  validates :email, presence: true, uniqueness: true, if: "uid.nil?", on: :create
  validates :email, email: { strict_mode: true }, if: "uid.nil?", on: :create
  validates :state, length: { is: 2 }
  validates :zip_code, length: { is: 5 }

  after_create :send_welcome_email

  def date_registered
    created_at.strftime("%m/%d/%Y")
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid             = auth_info.uid
      new_user.username        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token     = auth_info.credentials.token
      new_user.password_digest = auth_info.credentials.secret
    end
  end

  def send_welcome_email
    UserNotifierMailer.send_signup_email(self).deliver if self.email
  end

  def platform_admin?
    roles.exists?(name:'platform_admin')
  end

  def employer?
    roles.exists?(name: "employer")
  end

  def registered_user?
    roles.exists?(name: "registered_user")
  end
end
