// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-datepicker
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on('page:change', function() {
	startDate = new Date();
	FromEndDate = new Date();
	ToEndDate = new Date();

	ToEndDate.setDate(ToEndDate.getDate()+30);
    $('#scoot_leave_from').datepicker({
	    format: 'yyyy-mm-dd',
	    startDate: '0d',
	    endDate: '+30d', 
    	autoclose: true
	}).on('changeDate', function(selected){
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $('#scoot_leave_to').datepicker('setStartDate', startDate);
    }); 

	$('#scoot_leave_to').datepicker({
	    format: 'yyyy-mm-dd',
	    startDate: startDate,
	    endDate: ToEndDate, 
    	autoclose: true
	}).on('changeDate', function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $('#scoot_leave_from').datepicker('setEndDate', FromEndDate);
    });

});