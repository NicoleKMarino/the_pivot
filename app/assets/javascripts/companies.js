$(document).ready(function(){

  var $companies = $('.company');

  $('#company_filter_location').on('change', function(){
    var currentLocation = this.value;
    $companies.each(function (index, company) {
      $company = $(company);
      if ($company.data('status') === currentLocation) {
        $company.show();
      } else {
        $company.hide();
      }
    });
  });

});
