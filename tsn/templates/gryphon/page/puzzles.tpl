{% extends "gryphon/base.tpl" %}
{% block title %}:: Puzzles{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}Puzzles{% endblock %}

{% block content %}

<div class="grid_8">
	<h1>Puzzles</h1>

	<p>Sit back, relax, and enjoy our daily puzzles or download recent print edition solutions.<br /><br />
	Oh, hey there! Do you have <a href="http://statenews.com/index.php/feedback/puzzle/3">ideas for our puzzle page?</a>
</p>


	<div class="gray box">	
		<h4>Recent print edition solutons</h4>
		{% fetch puzzles from gryphon:media with [
			'where': 'media:status = 1',
			'order': 'media:created desc',
			'limit': '5',
			'withTags': ['puzzle_solutions']
		] %}
		<ul>
			{% for puzzle in puzzles %}
				<li><a href="{{ puzzle.urlOriginal }}">{{ puzzle.title }}</a></li>
			{% endfor %}
		</ul>
	</div>
	<hr />

	

	<a name="puzzle"></a>
<h3>Play <a href="http://www.uclick.com/client/sne/fcx" target="puzzle">Crossword</a> or <a href="http://www.uclick.com/client/sne/sudoc" target="puzzle">Sudoku</a></h3>
<iframe height="800" width="620" name="puzzle" src="http://www.uclick.com/client/sne/fcx" seamless></iframe>
		
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}