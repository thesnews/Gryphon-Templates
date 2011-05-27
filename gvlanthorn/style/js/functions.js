$(function(){
	$('.tabheader > ul').tabs();
	
	// $(".imagetabs > ul").tabs({ fx: { opacity: 'toggle', duration: 100 } });
	

	var galleryTabs = $("#galtabs").tabs();
	
	$('.galnav > a.next').click(function() {
		galleryTabs.tabs('select', $(this).attr('href') );
		return false;
	});
	
	$('.galnav > a.prev').click(function() {
		galleryTabs.tabs('select', $(this).attr('href') );
		return false;
	});
	
	var moduleTabs = $("#galtabs-mod").tabs();
	
	$('.galnavdk > a.next').click(function() {
		moduleTabs.tabs('select', $(this).attr('href') );
		return false;
	});
	
	$('.galnavdk > a.prev').click(function() {
		moduleTabs.tabs('select', $(this).attr('href') );
		return false;
	});
	
	$('#nav tr td').hover(function () {
		$(this).addClass('over');
	}, function () {
		$(this).removeClass('over');
	});

/* Clearing Forms
	*******************************/

	$("input#search_field, input#comment_name, input#comment_email, input#comment_turing, textarea#comment_body, input#subscribe").focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});
	
});