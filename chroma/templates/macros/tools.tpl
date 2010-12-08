{% macro facebook(item) %}
	<script type="text/javascript">
	function fbs_click() {
		u = '{{ item.url }}';
		t = '{{ item.headline|urlencode }}';
		window.open(
			'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t),
			'sharer',
			'toolbar=0,status=0,width=626,height=436'
		);
		return false;
	}
	</script>
	<a href="http://www.facebook.com/share.php?u={{ item.url }}" onclick="return fbs_click()" target="_blank"><img src="{{ 'style/gryphon/images/tools-facebook.gif'|url }}" alt="Share this article on Facebook" /></a>
{% endmacro %}

{% macro twitter(item) %}
	<a href="http://twitter.com/home?status=Just read {{ item.url }}"  target="_blank" title="Share on Twitter"><img src="{{ 'style/gryphon/images/tools-twitter.gif'|url }}" alt="Share this article on Twitter" /></a></li>
{% endmacro %}

{% macro digg(item) %}
	<a href="http://digg.com/submit?phase=2&amp;url={{ item.url|urlencode }}&amp;title={{ item.headline|urlencode }}&amp;bodytext={{ item.abstract|urlencode }}" title="Submit this article to digg"><img src="{{ 'style/gryphon/images/tools-digg.gif'|url }}" alt="Digg this" /></a>
{% endmacro %}

{% macro delicious(item) %}
	<a href="http://del.icio.us/post" onclick="window.open('http://del.icio.us/post?v=4&amp;noui&amp;jump=close&amp;url='+encodeURIComponent('{{ item.url }}')+'&amp;title='+encodeURIComponent('{{ item.headline }}'), 'delicious','toolbar=no,width=700,height=400'); return false;" title="Add to del.icio.us"><img src="{{ 'style/gryphon/images/tools-delicious.gif'|url }}" alt="Add to del.icio.us" /></a>
{% endmacro %}

{% macro blogger(item) %}
	<a href="javascript:popw='';Q='';x=document;y=window;if(x.selection) {Q=x.selection.createRange().text;} else if (y.getSelection) {Q=y.getSelection();} else if (x.getSelection) {Q=x.getSelection();}popw = y.open('http://www.blogger.com/blog_this.pyra?t=' + escape(Q) + '&amp;u=' + escape('{{ item.url }}') + '&amp;n=' + escape('{{ item.headline }}'),'bloggerForm','scrollbars=no,width=475,height=300,top=175,left=75,status=yes,resizable=yes');if (!document.all) T = setTimeout('popw.focus()',50);void(0);" title="Submit this story to Blogger"><img src="{{ 'style/gryphon/images/tools-blogger.gif'|url }}" alt="Blogger" /></a>
{% endmacro %}

{% macro feed(item) %}
	<a href="{{ item.url }}.xml"><img src="{{ 'style/gryphon/images/feed.png'|url }}" alt="Comment feed" /></a>
{% endmacro %}

{% macro print(item) %}
	<a href="{{ item.url }}" onclick="window.print();return false;"><img src="{{ 'style/gryphon/images/printer.png'|url }}" alt="Print" /></a>
{% endmacro %}

