<div class="section_tabs">

<ul class="tab-box" id="section_tabs_nav">

	<li>
		<ul><li id="news_tab"><a href="#" class="tab-header">News</a></li></ul>
 		<br />
 		<ul class="bullet">
 		<div class="news_content">
 			{% fetch articles from article with [
			'limit': 8,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['news']
			]
			%}
 			<h3>Top Stories in <a href="{{ 'section/news'|url }}">News</a>:</h3>
 			<ul>{% for article in articles %}
			<li><a href="{{ article.url }}">{{ article.headline|clip(50) }}</a></li>
			{% endfor %}</ul>
		</div>

		</ul>

	</li>
	
	<li>
		<ul class="tab"><li id="sports_tab"><a href="#" class="tab-header">Sports</a></li></ul>
		<br />
		<ul class="bullet">
		<div class="sports_content">
		{% fetch articles from article with [
			'limit': 8,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['sports']
			]
			%}
 			<h3>Top Stories in <a href="{{ 'section/sports'|url }}">Sports</a>:</h3>
 			<ul>{% for article in articles %}
			<li><a href="{{ article.url }}">{{ article.headline|clip(50) }}</a></li>
			{% endfor %}</ul>
		</ul>
	</li>
	
	<li>
		<ul class="tab"><li id="opinion_tab"><a href="#" class="tab-header">Opinion</a></li></ul>
		<br />
		 <ul class="bullet">
	    <div class="opinion_content">
		{% fetch articles from article with [
			'limit': 8,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['opinion']
			]
			%}
 			<h3>Top Stories in <a href="{{ 'section/opinion'|url }}">Opinion</a>:</h3>
 			<ul>{% for article in articles %}
			<li><a href="{{ article.url }}">{{ article.headline|clip(50) }}</a></li>
			{% endfor %}</ul>

	    </div>
	    </ul>
	</li>

	<li>
		<ul class="tab"><li id="entertainment_tab"><a href="#" class="tab-header">Entertainment</a></li></ul>
		<br />
		 <ul class="bullet">
	    <div class="entertainment_content">
		{% fetch articles from article with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['entertainment']
			]
			%}
 			<h3>Top Stories in <a href="{{ 'section/features'|url }}">Entertainment</a>:</h3>
 			<ul>{% for article in articles %}
				<li><a href="{{ article.url }}">{{ article.headline|clip(50) }}</a></li>
			{% endfor %}</ul>

	    </div>
	    </ul>
	</li>
	
	<li>
		<ul class="tab"><li id="multimedia_tab"><a href="#" class="tab-header">Multimedia</a></li></ul>
		<br />
	    <ul class="bullet">
	    <div class="multimedia_content">
	    	<h3>Top <a href="{{ 'multimedia'|url }}">Multimedia</a> Pieces:</h3>
		{% fetch multimedia from media with [
			'limit': 6,
			'order': 'weight desc, created desc',
			'where': 'status = 1',
			'withTags': ['Multimedia Box']
			]
			%}
 			<ul>
 			{% for media in multimedia %}
			<li><a href="{{ media.url }}">{{ media.title }}</a> | {{ media.type }}</li>
			{% endfor %}
			</ul>

		</div>
		</ul>
	</li>
	
	<li>
		<ul class="tab"><li id="comments_tab"><a href="#" class="tab-header">Comments</a></li></ul>
		<br />
		<ul class="bullet">
		<div class="comments_content">
    		<h3>Recent Comments:</h3>
			{% fetch comments from comment with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 5,
				'forceCache': true
			] %}
			{% for comment in comments %}
				<li>
					{{ comment.name }} said: "{{ comment.preview }}"
					<small>({{ comment.created|date('m/d h:i a') }})</small>
					<a href="{{ comment.url }}">more &#187;</a>
				</li>
			{% endfor %}
			
			
		</div>
		</ul>
	</li>
		
</ul>

</div>