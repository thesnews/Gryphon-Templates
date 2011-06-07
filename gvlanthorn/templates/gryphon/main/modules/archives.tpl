	<div class="mod-head">
		<h4>PDF Archives</h4>
	</div>
	<div class="mod mb">
		<div class="inner">
		
		
			{% fetch pdf from media with [
				'where': 'status = 1',
				'limit': 1,
				'order': 'uid desc',
				'withTags': ['frontpagepdf']
			] %}
		<div class="mmb" style="text-align:center">
			<a href="{{ pdf[0].urlOriginal }}"><img id="paper" src="{{ pdf[0].urlPreview }}" alt="Frontpage Preview" /></a>
		</div>

		<div class="aside2" style="text-align:right"><a href="http://www.gvlarchives.com/pdfs">VIEW THE LANTHORN ONLINE &raquo;</a></div>

		
		</div>	
	</div>