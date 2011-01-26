$(function(){
	
	
	
	/* Featured Stories
	********************************/
	
	$("#featured_stories").tabs({fx: {opacity: 'toggle', width: 'toggle'}}).tabs('rotate', 8000);
	
	/* Gallery
	********************************/
	
	$("#gallery").tabs({fx: {opacity: 'toggle', width: 'toggle'}});
	
	/* Tabbed Section Browser Module
	*******************************/
	
	$("#section_tabs").tabs({selected: 5});
		
		$("#news_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","0px 22px");
	 	});

		$("#sports_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","-220px 22px");
	 	});
	
		$("#opinion_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","-440px 22px");
	 	});
	
		$("#entertainment_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","-660px 22px");
	 	});

		$("#multimedia_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","-880px 22px");
	 	});

		$("#comments_tab a").click(function () {
		    $("#section_tabs_nav").css("background-position","-1100px 22px");
	 	});
	
	/* Featured Multimedia Module
	*******************************/
	
	$("#featured_multimedia").tabs({fx: {opacity: 'toggle', width: 'toggle'}});
	
	/* Upcoming Events Module
	*******************************/
	
	$("#upcoming_events").tabs({fx: {opacity: 'toggle'}});
	
	/* Poll Module
	*******************************/
	
	$('input#submit').click(function(){
		$('#vote').hide('slow', function() {
			$('#results').show('slow');
		});
		return false;
	  });
	 
	 /* Search Page
	*******************************/
	
	$('p#adv_search a').click(function(){
		$('form#basic_search').slideUp('slow', function() {
			$('p#adv_search').hide();
			$("p#basic_search").css("display","block"); 
			$('form#adv_search').slideDown('slow');
		});
		return false;
	  });
	  
	$('p#basic_search a').click(function(){
		$('form#adv_search').slideUp('slow', function() {
			$('p#basic_search').hide();
			$("p#adv_search").show(); 
			$('form#basic_search').slideDown('slow');
		});
		return false;
	  });

		
	/* Article Text Resizer
	*******************************/
	
	$('span#text_size a').click(function(){
		var ourText = $('div#article_body p');
		var currFontSize = ourText.css('fontSize');
		var finalNum = parseFloat(currFontSize, 10);
		var stringEnding = currFontSize.slice(-2);
			if(this.id == 'text_up') {
				finalNum *= 1.1;
			}
			else if (this.id == 'text_down'){
				finalNum /=1.1;
			}
		ourText.css('fontSize', finalNum + stringEnding);
		return false;
	});
	
	/* Comment Flasher
	*******************************/
	
	$("div#join_convo a").click(function () {
	      $("input#comment_name, input#comment_email, input#comment_turing, textarea#comment_body").animate({ backgroundColor: "#F8EBB8" }, 300).animate({ backgroundColor: "white" }, 500);
	});
	
	/* Clearing Forms
	*******************************/
	
	$("input#search_field, input#comment_name, input#comment_email, input#comment_turing, textarea#comment_body, input#subscribe, input#query_field, form#adv_search input").focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});

	
	
});

