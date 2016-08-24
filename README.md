# MakeMyPayday

### Here's what you'll need to do to pull down code and run on a local machine
* `bundle`
* `rake db:drop db:create db:migrate db:seed`

#Tests
*To run a test: 'rspec'


The Pivot is a collaborative Rails project that builds a multi-tenancy ecommerce website adapted from an existing codebase in 2 weeks. MakeMyPayday is a job platform for employers to post available jobs and job seekers to search and apply for jobs.

Production Website - makemypayday.herokuapp.com/

## Features:

### Guest User
Visit different companies.
Add jobs from multiple companies into a bucket of applications.
Log in or create an account before submitting an application.


### Registered User

Apply to jobs for any company
Interactive company and job filters with jQuery
Manage my account information
View my job application history


### Employer Admin

Manage jobs at my companies
Update my company information


### Platform Admin

Approve or decline the creation of new employers
Take an employer offline / online
Perform any functionality restricted to business admins


**Project Goals**: Multi-tenancy, authentication, brownfield development.

**Tech Stack**: Ruby on Rails, RSpec, Capybara and Capybara Webkit,  PostgreSQL, Bootstrap, Heroku.



Contributors:
* [Nicole Marino](https://github.com/NicoleKMarino)
* [Roberta Doyle](https://github.com/roscalabrin)
* [Lane Winham](https://github.com/Laner12)
* [Deb Hamel](https://github.com/deborahleehamel)
