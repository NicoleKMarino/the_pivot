desc "Delete started applications after 3 days"
task :clear_unfinished_job_applications => :environment do
  puts "Rake task started"
  apps = JobApplication.where("status = ? AND created_at < ?", 0, Time.now - 3*24*60*60)
    apps.destroy_all
  puts "Rake task complete. Started apps = #{apps.count}"
end