{% macro init(appID) %}
	
	<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>
	
	<script type="text/javascript">
		document.addEvent('domready', function() {
			$(document.body).adopt(new Element('div', {
				'id': 'fb-root'
			}));
			
			FB.init({
				appId: "{{ appID }}",
				status: true,
				cookie: true,
				xfbml: true
			});
	
		});

	</script>
</script>
{% endmacro %}