$(document).ready(function(){

  var $jobs = $('.job');

  $('#job_filter_location').on('change', function(){
    var currentLocation = this.value;
    var scopedJobs = $([])
    $jobs.each(function (index, job) {
      $job = $(job);
      if ($job.data('status') === currentLocation) {
        scopedJobs.push($job);
        $job.show();
      } else {
        $job.hide();
      }
    });
    var currentSalary = $('#job_filter_salary').val();
    if (currentSalary !== '') showAllSalaryBasedJobs(currentSalary, scopedJobs);
  });

  $('#job_filter_salary').on('change', function(){
    var currentSalary = this.value;
    var currentLocation = $('#job_filter_location').val();

    if (currentLocation === '') {
      return showAllSalaryBasedJobs(currentSalary, $jobs);
    }

    $jobs.each(function (index, job) {
      job = $(job);

      var jobSalary = job.data('salary');
      var jobLocation = job.data('status');

      if (jobSalary === currentSalary && currentLocation ===  jobLocation) {
        job.show();
      } else {
        job.hide();
      }
    });
  });
});

var showAllSalaryBasedJobs = function(currentSalary, $jobs) {
  debugger
  $jobs.each(function (index, job) {
    job = $(job)

    var jobSalary = job.data('salary');
    if (jobSalary === currentSalary) {
      job.show();
    } else {
      job.hide();
    }
  });
}
