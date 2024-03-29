// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require cocoon
//= require dataTables/jquery.dataTables
//= require tinymce
//= require_tree .

$(function() {
	$('.aboutCarousel').carousel({
		// 1000ms = 1 second
		interval: 3000
	});
});

function followLink(url){
	document.location.href = url;
}