$(document).ready(function(){
  
  var $jobs = $('.job');

  $('#job_filter_location').on('change', function(){
    var currentLocation = this.value;
    $jobs.each(function (index, job) {
      $job = $(job);
      if ($job.data('status') === currentLocation) {
        $job.show();
      } else {
        $job.hide();
      }
    });
  });
});