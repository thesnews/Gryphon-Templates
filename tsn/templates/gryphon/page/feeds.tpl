{% extends "gryphon/base.tpl" %}
{% block title %}:: Feeds{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}
	
	<div class="grid_8">
	
		<h1>Feeds, Syndication and Widges</h1>
		<h3>(oh my!)</h3>
		
		<hr class="spacer" />
		
		<div class="grid_4 alpha">
			<h5>RSS/Atom Feeds:</h5>
			
			<p>
				RSS and Atom feeds allow you to add State News content to your favorite feed reader, like <a href="http://reader.google.com">Google Reader</a> or add us to your <a href="http://facebook.com">Facebook</a> news feed.
			</p>
			
			<ul class="bullet">
				<li><a href="{{ 'gryphon:recent/article.xml'|url }}">Recent Articles and Blogs</a></li>
				<li><a href="{{ 'gryphon:recent/comment.xml'|url }}">Recent Comments</a></li>
				<li><strong>Blogs:</strong>
					<ul class="bullet">
						{% fetch blogs from blog with [
							'where': 'status = 1',
							'order': 'name asc'
						] %}
						{% for blog in blogs %}
							<li><a href="{{ blog.url }}.xml">{{ blog.name }}</a></li>
						{% endfor %}
					</ul>
				</li>
				<li><strong>Sections:</strong>
					<ul>
						<li><a href="<?php echo Foundry::link( 'section/pageOne.xml' ) ?>">Top Stories</a></li>
						<li><a href="<?php echo Foundry::link( 'section/news.xml' ) ?>">News</a>
							<ul>
								<li><a href="<?php echo Foundry::link( 'section/city.xml' ) ?>">City</a></li>
								<li><a href="<?php echo Foundry::link( 'section/campus.xml' ) ?>">Campus</a></li>
							</ul>
						</li>
						<li><a href="<?php echo Foundry::link( 'section/sports.xml' ) ?>">Sports</a>
							<ul>
								<li><a href="{{ 'gryphon:section/baseball.xml'|url }}">Baseball</a></li>
								<li><a href="{{ 'gryphon:section/basketball.xml'|url }}">Basketball</a></li>
								<li><a href="{{ 'gryphon:section/crosscountry.xml'|url }}">Cross Country</a></li>
								<li><a href="{{ 'gryphon:section/football.xml'|url }}">Football</a></li>
								<li><a href="{{ 'gryphon:section/golf.xml'|url }}">Golf</a></li>
								<li><a href="{{ 'gryphon:section/gymnastics.xml'|url }}">Gymnastics</a></li>
								<li><a href="{{ 'gryphon:section/fieldhockey.xml'|url }}">Field Hockey</a></li>
								<li><a href="{{ 'gryphon:section/icehockey.xml'|url }}">Ice Hockey</a></li>
								<li><a href="{{ 'gryphon:section/rowing.xml'|url }}">Rowing</a></li>
								<li><a href="{{ 'gryphon:section/soccer.xml'|url }}">Soccer</a></li>
								<li><a href="{{ 'gryphon:section/softball.xml'|url }}">Softball</a></li>
								<li><a href="{{ 'gryphon:section/swimmingdiving.xml'|url }}">Swimming &amp; Diving</a></li>
								<li><a href="{{ 'gryphon:section/trackfield.xml'|url }}">Track &amp; Field</a></li>
								<li><a href="{{ 'gryphon:section/volleyball.xml'|url }}">Volleyball</a></li>
								<li><a href="{{ 'gryphon:section/wrestling.xml'|url }}">Wrestling</a></li>
							</ul>
						
						</li>
						<li><a href="{{ 'gryphon:section/opinion.xml'|url }}">Opinion</a>
							<ul>
								<li><a href="{{ 'gryphon:section/editorials.xml'|url }}">Editorials</a></li>
								<li><a href="{{ 'gryphon:section/columns.xml'|url }}">Columns</a></li>
								<li><a href="{{ 'gryphon:section/letters.xml'|url }}">Letters</a></li>
							</ul>
						</li>
						<li><a href="{{ 'gryphon:section/features.xml'|url }}">Features</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="grid_4 omega">
			
			<h5>We're social too!</h5>
			
			<script src="http://widgets.twimg.com/j/2/widget.js"></script>
			<script>
			new TWTR.Widget({
			  version: 2,
			  type: 'profile',
			  rpp: 3,
			  interval: 6000,
			  width: 'auto',
			  height: 225,
			  theme: {
				shell: {
				  background: '#ffffff',
				  color: '#333333'
				},
				tweets: {
				  background: '#f1f1f1',
				  color: '#333333',
				  links: '#588658'
				}
			  },
			  features: {
				scrollbar: false,
				loop: false,
				live: true,
				hashtags: true,
				timestamp: true,
				avatars: false,
				behavior: 'all'
			  }
			}).render().setUser('thesnews').start();
			</script>
			
			<hr class="spacer" />

			<iframe src="http://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FThe-State-News%2F62758758853&amp;width=292&amp;colorscheme=light&amp;connections=10&amp;stream=false&amp;header=true&amp;height=300" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:300px;" allowTransparency="true"></iframe>
				
		</div>
		
		<hr class="spacer" />
	
	</div>
	<div class="grid_4">
		{% include 'gryphon/main/sidebar-short.tpl' %}
	</div>
	<hr class="spacer" />
{% endblock %}