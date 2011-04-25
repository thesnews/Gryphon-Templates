<script type="text/javascript" src="<?php echo Foundry::path( 'flash/jwplayer/swfobject.js' ) ?>"></script>
<div class="jwplayer" id="player-<?php echo $this->uid ?>" style="width:620px"></div>
<script type="text/javascript">
//<![CDATA[
 $(document).ready(function() {
 var s1 = new SWFObject("<?php echo Foundry::path( 'flash/jwplayer/player.swf' ) ?>","ply","620","367","9","#FFFFFF");
  s1.addParam("allowfullscreen","true");
  s1.addParam("allownetworking","all");
  s1.addParam("allowscriptaccess","always");
  s1.addVariable('plugins', 'viral-1');
  s1.addParam("flashvars","file=<?php echo $this->originalUrl ?>&image=<?php echo $this->bigUrl ?>&viral.callout=always&viral.onpause=false&viral.link=<?php echo Foundry::config( 'serverPrefix' ).$this->url ?>");
  s1.write("player-<?php echo $this->uid ?>");
});
//]]>
</script>