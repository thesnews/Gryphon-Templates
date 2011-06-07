		<div class="mod-head">
			<h4>Social Media</h4>
		</div>
		<div class="mod mb">
			<div class="inner">
				<ul class="links">
				
					{% set urls = config.get('dsw:twitterurl') %}
					{% if urls %}
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:twitterurl'|url }}" class="head4">Twitter</a></li>
					{% endif %}
					
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/lanthornsports" class="head4">Twitter (Sports)</a></li>
			
					<li><img src="{{ 'style/assets/twitter.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/gvlarts" class="head4">Twitter (A&amp;E)</a></li>
		
					{% set urls = config.get('dsw:facebookurl') %}
					{% if urls %}
			<li><img src="{{ 'gfn-lanthorn/assets/facebook.png'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:facebookurl'|url }}" class="head4">Facebook</a></li>
					{% endif %}
			
			<li><img src="{{ 'gfn-lanthorn/assets/youtube.png'|url }}" style="position:relative;top:2px;left:-1px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.youtube.com/user/gvsulanthorn" class="head4" style="margin-left:-1px;">YouTube</a></li>
			
					{% set urls = config.get('dsw:emailurl') %}
					{% if urls %}			
			<li><img src="{{ 'gfn-lanthorn/assets/icons/email_14.gif'|url }}" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'dsw:emailurl'|url }}" target="_blank" class="head4">Email Edition</a></li>
					{% endif %}
			
			<li><img src="{{ 'gfn-lanthorn/assets/29.png'|url }}" style="position:relative;top:1px;margin-right:2px;" alt="icn" />&nbsp;&nbsp;<a href="{{ 'page/feeds'|url }}" class="head4">RSS Feeds</a></li>


				</ul>
			</div>
		</div>	
