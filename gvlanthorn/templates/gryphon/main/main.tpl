{% extends "gryphon/base.tpl" %}

{% block content %}

{% set topStory = articles.shift() %}
{% set secondaryStories = articles.shift(3) %}
{% import "macros/article.tpl" as articleRender %}

{% include 'gryphon/main/header.tpl' %}


<!-- When working on the main page I used the html from the source page of the Lanthorn home. To view the original php, open the main page in the global folder. I'm attempting to fill in the twig based on whats there, rather than use the php because php will break it and I will not be able to see the actual site I am working on. -->

<div id="main" class="container_12">
	
	<div class="grid_5">

		{{ articleRender.abstract5Col(topStory) }}		
	
	</div>

	<div class="grid_3">
		{% for article in secondaryStories %}
			{{ articleRender.abstract3Col(article) }}
		{% endfor %}			
				
	</div>

	<div class="grid_4">
		<form method="get" id="searchform" class="mb" action="/index.php/search/" >
			<input type="text" name="q" size="30" value="" /> <input type="submit" id="searchsubmit" value="Search" />
		</form>
		
		{% include 'gryphon/main/multimedia_featured.tpl' %}
		
		</div>

	<hr class="grid_12 thick" />

	<div class="grid_3">
		<h2 class="mmb">News</h2>
		<hr class="mmb" />
		{% fetch news from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['news']
		]
		%}
		<ul class="links mb">
			{% for article in news %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">Sports</h2>
		<hr class="mmb" />
		{% fetch sports from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['sports']
		]
		%}
		<ul class="links mb">
			{% for article in sports %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">A&amp;E</h2>
		<hr class="mmb" />
		{% fetch ae from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['news']
		]
		%}
		<ul class="links mb">
			{% for article in ae %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

	<div class="grid_3">
		<h2 class="mmb">Laker Life</h2>
		<hr class="mmb" />
		{% fetch laker_life from article with [
		'limit': 6,
		'order': 'weight desc, created desc',
		'where': 'status = 1',
		'withTags': ['news']
		]
		%}
		<ul class="links mb">
			{% for article in laker_life %}
			<li><a href="{{ article.url }}">{{ article.headline }}</a>&nbsp;<span class="dateline aside">{{ article.created|date('M d') }}</span></li>
			{% endfor %}
		</ul>
	</div>

<hr class="grid_12 thick mb" />

<div class="grid_4">
	<div class="mod-head tabheader">
	<ul>

		<li><a href="#tab-blogs">Blog Posts</a></li>
		<li><a href="#tab-comments">Comments</a></li>
		<li><a href="#tab-popular">Popular</a></li>
	</ul>
</div>
<div class="mod mb">
	<div class="inner">
		<div id="tab-popular">

			<ul class="links boot">
									<li>
						<a href="http://www.lanthorn.com/index.php/article/2010/10/we_are_not_going_to_stop_partying_letter_to_the_editor">'We are not going to stop partying' (letter to the editor)</a> &nbsp;<span class="dateline aside">NOV&nbsp;9</span><span class="dateline aside"> | 20&nbsp;COMMENTS</span>
					</li>
									<li>

						<a href="http://www.lanthorn.com/index.php/article/2010/12/kappa_sigma_smashes_stress">Kappa Sigma smashes stress</a> &nbsp;<span class="dateline aside">DEC&nbsp;16</span><span class="dateline aside"> | 19&nbsp;COMMENTS</span>
					</li>
									<li>
						<a href="http://www.lanthorn.com/index.php/article/2011/04/letter_to_the_editor_confessions_from_a_disgruntle_member_of_the_church_of_atheism">Letter to the Editor: Confessions from a Disgruntle Member of the Church of Atheism</a> &nbsp;<span class="dateline aside">APR&nbsp;6</span><span class="dateline aside"> | 18&nbsp;COMMENTS</span>

					</li>
									<li>
						<a href="http://www.lanthorn.com/index.php/article/2011/04/students_allege_professor_misconduct">Students allege professor misconduct</a> &nbsp;<span class="dateline aside">APR&nbsp;21</span><span class="dateline aside"> | 18&nbsp;COMMENTS</span>
					</li>
									<li>

						<a href="http://www.lanthorn.com/index.php/article/2011/04/letter_to_the_editor_letter_on_atheism_offensively_non_genuine">Letter to the Editor: Letter on Atheism 'offensively non genuine'</a> &nbsp;<span class="dateline aside">APR&nbsp;10</span><span class="dateline aside"> | 14&nbsp;COMMENTS</span>
					</li>
							</ul>
		</div>
		
		<div id="tab-comments">

			<ul class="links boot">
									<li><strong>Jasmine</strong> on <a href="http://www.lanthorn.com/index.php/comment/view/486">Hide yo' kids, hide yo' wife</a></li>
									<li><strong>Adam</strong> on <a href="http://www.lanthorn.com/index.php/comment/view/485">'Friday' is the worst song ever, but don't blame Black</a></li>
									<li><strong>Brett Colley, Art &amp; Design Faculty</strong> on <a href="http://www.lanthorn.com/index.php/comment/view/484">Students allege professor misconduct</a></li>

									<li><strong>A</strong> on <a href="http://www.lanthorn.com/index.php/comment/view/483">Letter to the Editor: Confessions from a Disgruntle Member of the Church of Atheism</a></li>
									<li><strong>A</strong> on <a href="http://www.lanthorn.com/index.php/comment/view/482">Letter to the Editor: Confessions from a Disgruntle Member of the Church of Atheism</a></li>
							</ul>
		</div>
		
		<div id="tab-blogs">

			<ul class="links boot">
									<li><a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad/2011/04/paranoia_and_existentialism_in_chile">Paranoia and existentialism in Chile</a> &nbsp;<span class="dateline aside">APR&nbsp;20</span>					<br /><strong>Posted in</strong>: <a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad">Notes from Abroad</a></li>
									<li><a href="http://www.lanthorn.com/index.php/blog/government/2011/04/three_cheers_for_congress">Three cheers for Congress</a> &nbsp;<span class="dateline aside">APR&nbsp;14</span>					<br /><strong>Posted in</strong>: <a href="http://www.lanthorn.com/index.php/blog/government">Government</a></li>

									<li><a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad/2011/04/cultures_converge_at_sunshine_coast">Cultures converge at Sunshine Coast</a> &nbsp;<span class="dateline aside">APR&nbsp;6</span>					<br /><strong>Posted in</strong>: <a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad">Notes from Abroad</a></li>
									<li><a href="http://www.lanthorn.com/index.php/blog/government/2011/04/mans_malaise">Man’s Malaise</a> &nbsp;<span class="dateline aside">APR&nbsp;6</span>					<br /><strong>Posted in</strong>: <a href="http://www.lanthorn.com/index.php/blog/government">Government</a></li>

									<li><a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad/2011/03/an_education_denmark_style">An Education: Denmark style</a> &nbsp;<span class="dateline aside">MAR&nbsp;31</span>					<br /><strong>Posted in</strong>: <a href="http://www.lanthorn.com/index.php/blog/notes_from_abroad">Notes from Abroad</a></li>
							</ul>
		</div>
	</div>
</div>	
	<div class="mod-head">

	<h4>Spring Football Game</h4>
</div>

<ul id="galtabs-mod">
			<li><a href="#modimg1"></a></li>
			<li><a href="#modimg2"></a></li>
			<li><a href="#modimg3"></a></li>
			<li><a href="#modimg4"></a></li>
			<li><a href="#modimg5"></a></li>
			<li><a href="#modimg6"></a></li>

			<li><a href="#modimg7"></a></li>
			<li><a href="#modimg8"></a></li>
			<li><a href="#modimg9"></a></li>
			<li><a href="#modimg10"></a></li>
			<li><a href="#modimg11"></a></li>
			<li><a href="#modimg12"></a></li>
			<li><a href="#modimg13"></a></li>
			<li><a href="#modimg14"></a></li>
			<li><a href="#modimg15"></a></li>

			<li><a href="#modimg16"></a></li>
			<li><a href="#modimg17"></a></li>
			<li><a href="#modimg18"></a></li>
			<li><a href="#modimg19"></a></li>
			<li><a href="#modimg20"></a></li>
	</ul>

<div id="modimg1" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg2" class="next"></a>
						
							<a class="prev-inactive"></a>
					
			<em class="sm">Image 1 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4824__MG_3293_small.jpg" alt="_MG_3293" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4824"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg2" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg3" class="next"></a>
						
							<a href="#modimg1" class="prev"></a>
					
			<em class="sm">Image 2 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4825__MG_3294_small.jpg" alt="_MG_3294" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4825"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg3" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg4" class="next"></a>
						
							<a href="#modimg2" class="prev"></a>
					
			<em class="sm">Image 3 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4826__MG_3299_small.jpg" alt="_MG_3299" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4826"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg4" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg5" class="next"></a>
						
							<a href="#modimg3" class="prev"></a>
					
			<em class="sm">Image 4 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4827__MG_3301_small.jpg" alt="_MG_3301" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4827"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg5" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg6" class="next"></a>
						
							<a href="#modimg4" class="prev"></a>
					
			<em class="sm">Image 5 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4828__MG_3305_small.jpg" alt="_MG_3305" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4828"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg6" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg7" class="next"></a>
						
							<a href="#modimg5" class="prev"></a>
					
			<em class="sm">Image 6 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4829__MG_3311_small.jpg" alt="_MG_3311" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4829"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg7" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg8" class="next"></a>
						
							<a href="#modimg6" class="prev"></a>
					
			<em class="sm">Image 7 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4830__MG_3315_small.jpg" alt="_MG_3315" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4830"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg8" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg9" class="next"></a>
						
							<a href="#modimg7" class="prev"></a>
					
			<em class="sm">Image 8 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4831__MG_3317_small.jpg" alt="_MG_3317" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4831"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg9" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg10" class="next"></a>
						
							<a href="#modimg8" class="prev"></a>
					
			<em class="sm">Image 9 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4832__MG_3320_small.jpg" alt="_MG_3320" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4832"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg10" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg11" class="next"></a>
						
							<a href="#modimg9" class="prev"></a>
					
			<em class="sm">Image 10 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4833__MG_3324_small.jpg" alt="_MG_3324" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4833"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg11" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg12" class="next"></a>
						
							<a href="#modimg10" class="prev"></a>
					
			<em class="sm">Image 11 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4834__MG_3337_small.jpg" alt="_MG_3337" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4834"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg12" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg13" class="next"></a>
						
							<a href="#modimg11" class="prev"></a>
					
			<em class="sm">Image 12 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4835__MG_3338_small.jpg" alt="_MG_3338" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4835"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg13" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg14" class="next"></a>
						
							<a href="#modimg12" class="prev"></a>
					
			<em class="sm">Image 13 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4836__MG_3344_small.jpg" alt="_MG_3344" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4836"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg14" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg15" class="next"></a>
						
							<a href="#modimg13" class="prev"></a>
					
			<em class="sm">Image 14 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4837__MG_3345_small.jpg" alt="_MG_3345" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4837"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg15" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg16" class="next"></a>
						
							<a href="#modimg14" class="prev"></a>
					
			<em class="sm">Image 15 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4838__MG_3351_small.jpg" alt="_MG_3351" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4838"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg16" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg17" class="next"></a>
						
							<a href="#modimg15" class="prev"></a>
					
			<em class="sm">Image 16 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4839__MG_3352_small.jpg" alt="_MG_3352" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4839"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg17" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg18" class="next"></a>
						
							<a href="#modimg16" class="prev"></a>
					
			<em class="sm">Image 17 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4840__MG_3356_small.jpg" alt="_MG_3356" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4840"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg18" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a href="#modimg19" class="next"></a>
						
							<a href="#modimg17" class="prev"></a>
					
			<em class="sm">Image 18 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4841__MG_3368_small.jpg" alt="_MG_3368" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4841"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
<div id="modimg19" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">

							<a href="#modimg20" class="next"></a>
						
							<a href="#modimg18" class="prev"></a>
					
			<em class="sm">Image 19 of 20</em>
		</div>
	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4842__MG_3371_small.jpg" alt="_MG_3371" /></div>
		
		<div class="mmb">

							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4842"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>
		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>

	</div>
</div>
<div id="modimg20" class="panel ui-tabs-hide">
	<div class="mod-sub">
		<div class="galnavdk">
							<a class="next-inactive"></a>
						
							<a href="#modimg19" class="prev"></a>
					
			<em class="sm">Image 20 of 20</em>
		</div>

	</div>
	
	<div class="mb">
		<div class="mmb"><img src="/media/00/00/00/48/4843__MG_3373_small.jpg" alt="_MG_3373" /></div>
		
		<div class="mmb">
							<a class="reprints-button" href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=fbsync.htm&amp;b=photo_db&amp;show=1&amp;op_object_name=contains&amp;object_name=4843"></a>
						
			<div class="right aside2">Eric Coulter / GVL</div><div class="right aside2">Nathan Mehmed / GVL</div>			<div class="clear">&nbsp;</div>
		</div>

		
		<div class="caption">
			<p>Spring Football Game</p>
			
						<hr />
		</div>
	</div>
</div>
	
	<div class="mod-head">
	<h4>PDF Archives</h4>

</div>
<div class="mod mb">
	<div class="inner">
		<div class="mmb" style="text-align:center">
			<a href="http://www.gvlarchives.com/pdfs/single.php?id=166" target="_blank"><img src="/media/00/00/00/49/4910_cover_big.jpg" alt="PDF" /></a>
		</div>
		
		<div class="aside2" style="text-align:right"><a href="http://www.gvlarchives.com/pdfs">VIEW THE LANTHORN ONLINE &raquo;</a></div>
	</div>
</div>	
	<div class="grid_2 alpha">

		<div class="mb">
	<a href="http://ubs.gvsu.edu" target="new" title="" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/currentads/UBS140X140.jpg')">
		<img src="/media/ads/currentads/UBS140X140.jpg" alt="" border="0" /></a>
		<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/currentads/UBS140X140.jpg");
		});
		</script></div>		<div class="mb">
	<a href="http://www.grhopper.com/" target="new" title="" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/currentads/GRHopper_140x140_online.jpg')">
		<img src="/media/ads/currentads/GRHopper_140x140_online.jpg" alt="" border="0" /></a>
		<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/currentads/GRHopper_140x140_online.jpg");
		});
		</script></div>	</div>

	
	<div class="grid_2 omega">
		<div class="mb">
	<a href="http://www.lanthorn.com/index.php/page/advertising" target="new" title="" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/house/square.jpg')">
		<img src="/media/ads/house/square.jpg" alt="" border="0" /></a>
		<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/house/square.jpg");
		});
		</script></div>		<div class="mb">
	<a href="http://reprints.lanthorn.com/cgi-bin/fotobroker.cgi?c=start.htm" target="new" title="" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/house/PhotoStore_140x140.jpg')">
		<img src="/media/ads/house/PhotoStore_140x140.jpg" alt="" border="0" /></a>
		<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/house/PhotoStore_140x140.jpg");
		});
		</script></div>	</div>

	<div class="clear"></div>
</div>

<div class="grid_4">
	<div class="mod-head">
	<h4>Editorial</h4>
</div>
<div class="mod mb">
	<div class="inner">
				<div class="image">
			<a href="http://www.lanthorn.com/index.php/section/editorial"><img src="/media/00/00/00/49/4906_cartoon_small.jpg" alt="cartoon" /></a>

		</div>
		<div class="caption aside mb">Editorial cartoon</div>
				
		<hr class="mmb" />
		<ul class="links mb">
							<li><a href="http://www.lanthorn.com/index.php/article/2011/04/hide_yo_kids_hide_yo_wife">Hide yo' kids, hide yo' wife</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>
							<li><a href="http://www.lanthorn.com/index.php/article/2011/04/dont_let_them_steal_your_babys_face">Don't let them steal your baby's face</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>

							<li><a href="http://www.lanthorn.com/index.php/article/2011/04/graduation_looming_like_a_horror_movie_villain">Graduation looming like a horror movie villain</a>&nbsp;&nbsp;<span class="dateline aside">APR&nbsp;17</span></li>
					</ul>
	</div>
</div>	
	
<div class="mod-head">
	<h4>Valley Vote</h4>
</div>
<div class="mod mb">
	<div class="inner">

		<h5>Online poll: 4/21/2011</h5>
		<hr />
		
		<p><strong>	<p>Does administration do enough to address student concerns?</p></strong></p>
		
		<form method="post" action="/index.php/poll/vote/63">
		<a name="poll-63"></a>
		
				
			<fieldset class="mmb">
									<div class="mmb"><input type="radio" name="answer" id="answer-93cba07454f06a4a960172bbd6e2a435" value="93cba07454f06a4a960172bbd6e2a435" /> <label for="answer-93cba07454f06a4a960172bbd6e2a435">Yes</label></div>

									<div class="mmb"><input type="radio" name="answer" id="answer-bafd7322c6e97d25b6299b5d6fe8920b" value="bafd7322c6e97d25b6299b5d6fe8920b" /> <label for="answer-bafd7322c6e97d25b6299b5d6fe8920b">No</label></div>
							</fieldset>
		
			<div class="right"><a href="/index.php/poll/view/63">Results</a> | <a href="/index.php/poll/archive">Poll archive</a></div>
			<div><input type="submit" value="Submit" /></div>
			
		
		</form>
	</div>

</div>	
	<div class="grid_2 alpha">
		<div class="mod-head">
	<h4>Social Media</h4>
</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links">
						<li><img src="/gfn-lanthorn/assets/twitter.png" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/gvlanthorn" class="head4">Twitter</a></li>
						
			<li><img src="/gfn-lanthorn/assets/twitter.png" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/lanthornsports" class="head4">Twitter (Sports)</a></li>

			
			<li><img src="/gfn-lanthorn/assets/twitter.png" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.twitter.com/gvlarts" class="head4">Twitter (A&amp;E)</a></li>
			
						<li><img src="/gfn-lanthorn/assets/facebook.png" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.facebook.com/pages/Grand-Valley-Lanthorn/166694247852" class="head4">Facebook</a></li>
						
			<li><img src="/gfn-lanthorn/assets/youtube.png" style="position:relative;top:2px;left:-1px;" alt="icn" />&nbsp;&nbsp;<a href="http://www.youtube.com/user/gvsulanthorn" class="head4" style="margin-left:-1px;">YouTube</a></li>
			
						<li><img src="/gfn-lanthorn/assets/icons/email_14.gif" style="position:relative;top:2px;" alt="icn" />&nbsp;&nbsp;<a href="http://feedburner.google.com/fb/a/mailverify?uri=GrandValleyLanthorn&amp;loc=en_US" target="_blank" class="head4">Email Edition</a></li>
						
			<li><img src="/gfn-lanthorn/assets/29.png" style="position:relative;top:1px;margin-right:2px;" alt="icn" />&nbsp;&nbsp;<a href="/index.php/page/feeds" class="head4">RSS Feeds</a></li>
		</ul>

	</div>
</div>	</div>
	<div class="grid_2 omega">
		<div class="mod-head">
	<h4>Puzzle Solutions</h4>
</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links">

					</ul>
	</div>
</div>	</div>
	<div class="clear">&nbsp;</div>
	
	<div class="mb">
	<!-- Begin Monster Career Ad Network Creative for TRAK_JSW_grandval_co -->
	<script type="text/javascript" language="JavaScript">
	monster_jdn_affiliate="fe621ea3-32bb-4bc3-a52a-84064c9cc742";
	monster_jdn_ad_width=300;
	monster_jdn_ad_height=250;
	</script>
	<script type="text/javascript" language="JavaScript" src="http://jdn.monster.com/render/monster_jdn.js"></script>

	<!-- End Monster Career Ad Network Creative for TRAK_JSW_grandval_co -->
</div>	
		<div class="mb"><a href="http://www.lakercouponconnection.com" target="_blank"><img src="/gfn-lanthorn/assets/couponconnection.jpg" alt="Coupon Connection" /></a></div></div>

<div class="grid_4">
	<div class="mb">
<!-- UMD LAW IS NOT ON CURENT HOMEPAGE

	<a href="http://www.law.udmercy.edu/" target="new" title="UDM Law" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/currentads/UDL-064A_300x250OpenHseSpr2011GVSU.jpg')">
	<img src="/media/ads/currentads/UDL-064A_300x250OpenHseSpr2011GVSU.jpg" alt="UDM Law" border="0" /></a>
	<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/currentads/UDL-064A_300x250OpenHseSpr2011GVSU.jpg");
		});
	</script></div>	
	<div class="mod-head">
-->	
	
	<h4>Briefs</h4>

</div>
<div class="mod mb">
	<div class="inner">
		<ul class="links mb">
							<li><a href="http://www.lanthorn.com/index.php/section/briefs">Campus closed Feb. 2</a>&nbsp;&nbsp;<span class="dateline aside">FEB&nbsp;1</span></li>
							<li><a href="http://www.lanthorn.com/index.php/section/briefs">MCEEA essay contest now accepting applications</a>&nbsp;&nbsp;<span class="dateline aside">JAN&nbsp;30</span></li>
							<li><a href="http://www.lanthorn.com/index.php/section/briefs">Chat online with President Haas</a>&nbsp;&nbsp;<span class="dateline aside">JAN&nbsp;30</span></li>

							<li><a href="http://www.lanthorn.com/index.php/section/briefs">Annis Water Resources Institute internships</a>&nbsp;&nbsp;<span class="dateline aside">JAN&nbsp;30</span></li>
							<li><a href="http://www.lanthorn.com/index.php/section/briefs">Seminar highlights changes in food legislation</a>&nbsp;&nbsp;<span class="dateline aside">JAN&nbsp;21</span></li>
					</ul>
	</div>
</div>
	
	<div class="mod-head">

	<h4>Classifieds</h4>
</div>
<div class="mod mb">
	<div class="inner">
	
				
		<h5>In <a href="/index.php/classified/housing__roommates">Housing / Roommates</a></h5>
		<hr />
		<ul class="links mb">
			<li>

								<a href="/index.php/classified/housing__roommates#ad-273">Looking for 1 or 2 people to take over our 12 month lease starting in August. Its a 2&nbsp;&#133;</a>
							</li>
		</ul>
				
		<h5>In <a href="/index.php/classified/services">Services</a></h5>
		<hr />
		<ul class="links mb">
			<li>

								<a href="/index.php/classified/services#ad-272">Wanted: hard working individual to strip wall paper and paint in a dining room.  Job&nbsp;&#133;</a>
							</li>
		</ul>
				
		<h5>In <a href="/index.php/classified/housing__roommates">Housing / Roommates</a></h5>
		<hr />
		<ul class="links mb">
			<li>

								<a href="/index.php/classified/housing__roommates#ad-271">Looking to sublease 2 bedrooms at Copper Beech in a 4 bedroom apartment (guys).  Own&nbsp;&#133;</a>
							</li>
		</ul>
				
		<div class="aside2" style="text-align:right"><a href="/index.php/classified/">SEE MORE CLASSIFIEDS &raquo;</a></div>
	</div>
</div>	
	<!-- calendar widget -->

<div class="mod-head">
	<h4>Upcoming Events</h4>

</div>

<div id="events-mod" class="tabheader">
	<ul id="event-dates">
		<li><span>Wed</span><a href="#d-27">27</a></li>
		
		<li><span>Thu</span><a href="#d-28">28</a></li>
		
		<li><span>Fri</span><a href="#d-29">29</a></li>

		
		<li><span>Sat</span><a href="#d-30">30</a></li>
		
		<li><span>Sun</span><a href="#d-01">01</a></li>
	</ul>
	<div class="clear">&nbsp;</div>
</div>

<div class="mod mb">
	<div class="inner">

		<div id="d-27" class="eventtab">
							<p><span class="dateline aside">
				10:00 am 
				
				| </span><a href="/index.php/calendar/event/1ooouojvuo4t8nrvqba96s78fg?time=1303912800">Overeaters Anonymous (OA) Meeting</a></p>
							<p><span class="dateline aside">
				11:00 am 
				
				| </span><a href="/index.php/calendar/event/r3lj0sjp98oe0j44695euhof6c?time=1303916400">CFI Secular Lunch Hour</a></p>
							<p><span class="dateline aside">
				12:00 pm 
				
				| </span><a href="/index.php/calendar/event/gsgntd10ke7n5jlljfr1uuvgfs?time=1303920000">12-Step Meeting</a></p>

							<p><span class="dateline aside">
				3:00 pm 
				
				| </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1303930800">12-Step Meeting</a></p>
							<p><span class="dateline aside">
				6:00 pm 
				
				| </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1303941600">12-Step Meeting</a></p>
					</div>
		
		<div id="d-28" class="eventtab">
							<p><span class="dateline aside">

				11:00 am 
				
				| </span><a href="/index.php/calendar/event/r3lj0sjp98oe0j44695euhof6c?time=1304002800">CFI Secular Lunch Hour</a></p>
							<p><span class="dateline aside">
				3:00 pm 
				
				| </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1304017200">12-Step Meeting</a></p>
							<p><span class="dateline aside">
				6:00 pm 
				
				| </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1304028000">12-Step Meeting</a></p>
					</div>

		
		<div id="d-29" class="eventtab">
							<p><span class="dateline aside">
				3:00 pm 
				
				| </span><a href="/index.php/calendar/event/vbnp9hqgve3u38i9ora8ctdt8s?time=1304103600">12-Step Meeting</a></p>
							<p><span class="dateline aside">
				6:00 pm 
				
				| </span><a href="/index.php/calendar/event/m5pm3e5k6747p0g98bflcclmh4?time=1304114400">12-Step Meeting</a></p>
					</div>
		
		<div id="d-30" class="eventtab">

			<p>No events for this date</p>		</div>
		
		<div id="d-01" class="eventtab">
							<p><span class="dateline aside">
				All day 
				
				| </span><a href="/index.php/calendar/event/raift0u3siuocpvqc16bp0fgkc?time=1304222400">Alpha Sigma Phi Bike Trip</a></p>
					</div>
		
		<div class="aside2" style="text-align:right"><a href="/index.php/calendar/" class="head4">FULL CALENDAR &raquo;</a></div>

	</div>
</div>	
	<div class="mb">
	<a href="http://kentcountymentoring.org/" target="new" title="" onclick="pageTracker._trackEvent('Ads', 'Click', '/media/ads/currentads/KCMCWeb-2.jpg')">
		<img src="/media/ads/currentads/KCMCWeb-2.jpg" alt="" border="0" /></a>
		<script type="text/javascript">
		$(document).ready(function () {
			pageTracker._trackEvent("Ads", "Impression", "/media/ads/currentads/KCMCWeb-2.jpg");
		});
		</script></div></div>

<div class="clear">&nbsp;</div>

</div><!-- #main -->


{% include 'gryphon/main/footer.tpl' %}


{% endblock content %}
