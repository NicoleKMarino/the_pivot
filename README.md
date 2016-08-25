# MakeMyPayday

The Pivot is a collaborative Rails project that builds a multi-tenancy website adapted from an existing codebase. MakeMyPayday is a job platform for employers to post available jobs and job seekers to search and apply for jobs.

Production Website - http://makemypayday.herokuapp.com/

### Here's what you'll need to do to pull down code and run on a local machine
* `git clone https://github.com/NicoleKMarino/the_pivot.git`
* `cd the_pivot`
* `bundle`
* `rake db:drop db:create db:migrate db:seed`

#Tests
*To run a test: 'rspec'

## Features:

### Guest User
- Visit different companies.
- Company and job filters with jQuery
- Add jobs from multiple companies into a bucket of applications.
- Can start and application.
- Must Log in or create an account before submitting an application.


### Registered User

Apply to jobs for any company
Company and job filters with jQuery
Manage my account information
View my job application history


### Employer Admin

Add a job to a company
Take a companies offline / online
Update my company information


### Platform Admin

Approve or decline the creation of new employers
Take an employer offline / online
Perform any functionality restricted to platform admins


**Project Goals**: Multi-tenancy, authentication, brownfield development.

**Tech Stack**: Ruby on Rails, RSpec, Capybara and Capybara Webkit,  PostgreSQL, Bootstrap, Heroku.



Contributors:
* [Nicole Marino](https://github.com/NicoleKMarino)
* [Roberta Doyle](https://github.com/roscalabrin)
* [Lane Winham](https://github.com/Laner12)
* [Deb Hamel](https://github.com/deborahleehamel)
