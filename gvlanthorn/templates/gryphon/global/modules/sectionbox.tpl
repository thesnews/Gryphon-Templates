<?php
$section = _M('section')->findBySlug($data[0])->shift();
$limit = $data[1];

$articles = _M('article')->findByTags( $section->tags )->shift($limit);
?>
<h2 class="mmb"><?php echo $section->name ?></h2>
<hr class="mmb" />
<ul class="links mb">
	<?php foreach( $articles as $article ) : ?>
	<li<?php if( $article->status == 0 ) echo ' class="unp"'; ?>><a href="<?php echo $article->url ?>"><?php echo $article->headline_formatted ?></a> &nbsp;<?php echo $this->datelineHelper( 'Time', $article->modified ) ?></li>
	<?php endforeach; ?>
</ul>