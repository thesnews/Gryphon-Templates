{% extends "gryphon/base.tpl" %}
{% block title %}:: Interactive - Made over{% endblock %}

{% block styles %}
	<style type="text/css">
		#container_floor1, #container_floor2 {
			position: relative;
			background: #333;
			width: 600px;
			height: 349px;
			margin-left: 25px;
		}
		
		#infoContainers {
			display: none;
		}
		.infoContainer {
			text-align: center;
		}
			.infoContainer p, .infoContainer h4, .infoContainer div {
				text-align: left;
				padding: .5em;
			}
			.infoContainer h4 {
				margin: 0;
			}
			.infoContainer p {
				font-size: .9em;
			}
			.audioInfo {
				font-size: .9em;
				position: relative;
				top: -8px;
			}
			.infoContainer img {
				border: 1px solid #333;
			}
		.infoBox_header {
			text-align: right;
			background: #f1f1f1;
			padding: .25em;
			border-bottom: 1px solid #e1e1e1;
			margin-bottom: .25em;
		}
	</style>
{% endblock %}

{% block active %}multimedia{% endblock %}
{% block subActive %}Interactives{% endblock %}

{% block content %}

	<div class="grid_8">
	
		<script type="text/javascript" src="{{ 'interactive/makeover/house_interactive.js'|url }}"></script>
		
			
			<img src="{{ 'interactive/makeover/makeover_header.gif'| }}" alt="Made over" height="70px" style="height:70px;" />
			
			<div style="padding-left:25px;width:600px; font-size:.9em;">
			Last October, the Nickless family's Holt house was knocked down and replaced with a 3,300 square-foot home for Arlene Nickless and three boys &mdash; Andrew, 8, Noah, 9, and Aaron, 12 &mdash; on ABC's "Extreme Makeover: Home Edition." The result is a beautifully designed and fully functional house for the family, whose father, Tim, died in January 2008 of Hepatitis C he contracted while working as a critical care nurse. Here's a room-by-room look at the Nickless' house and yard, with commentary from Arlene and Aaron.
			<br /><br />
			Mouse over a room for more information.
			</div>
			<br />	
			<div id="container_floor1">
				<img src="{{ 'interactive/makeover/floor_1.gif'|url }}" id="floor1" />
			</div>
			<br />
			<div id="container_floor2">
				<img src="{{ 'interactive/makeover/floor_2.gif'|url }}" id="floor1" />
			</div>
			
			<div id="infoContainers">
				<div class="infoContainer" id="infoBox_backyardPoly">
					<h4>Backyard</h4>
		
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="400" height="299" id="soundslider" align="middle"><param name="allowScriptAccess" value="always" /><param name="movie" value="{{ 'interactive/makeover/backyard/soundslider.swf?size=2&format=xml'|url }}" /><param name="quality" value="high" /><param name="allowFullScreen" value="true" /><param name="menu" value="false" /><param name="bgcolor" value="#FFFFFF" /><embed src="{{ 'interactive/makeover/backyard/soundslider.swf?size=2&format=xml'|url }}" quality="high" bgcolor="#FFFFFF" width="400" height="299" name="soundslider" align="middle" menu="false" allowScriptAccess="always" type="application/x-shockwave-flash" allowFullScreen="true" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
		
					<p>
						An enormous play structure was placed in the middle of the backyard for the kids to climb in the warm months. Within the play structure is a clubhouse that has cable access, a wide-screen TV and an electric fireplace.			
					</p>
				</div>
				<div class="infoContainer" id="infoBox_greatRmPoly">
					<h4>Great Room</h4>
			
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="400" height="299" id="soundslider" align="middle"><param name="allowScriptAccess" value="always" /><param name="movie" value="{{ 'interactive/makeover/greatroom/soundslider.swf?size=2&format=xml'|url }}" /><param name="quality" value="high" /><param name="allowFullScreen" value="true" /><param name="menu" value="false" /><param name="bgcolor" value="#FFFFFF" /><embed src="{{ 'interactive/makeover/greatroom/soundslider.swf?size=2&format=xml'|url }}" quality="high" bgcolor="#FFFFFF" width="400" height="299" name="soundslider" align="middle" menu="false" allowScriptAccess="always" type="application/x-shockwave-flash" allowFullScreen="true" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
		
					<p>
						The Nickless' great room was built with a blend of cutting-edge technology and aesthetic Earth tones. In this room, the Nickless' watch television, control audio speakers built into the ceiling and display family pictures. The room's wall colors, flooring and potted plants are reminiscent of Tim, who was known as an outdoorsman.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_kitchenPoly">
					<h4>Kitchen</h4>
		
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="400" height="299" id="soundslider" align="middle"><param name="allowScriptAccess" value="always" /><param name="movie" value="{{ 'interactive/makeover/kitchen/soundslider.swf?size=2&format=xml'|url }}" /><param name="quality" value="high" /><param name="allowFullScreen" value="true" /><param name="menu" value="false" /><param name="bgcolor" value="#FFFFFF" /><embed src="{{ 'interactive/makeover/kitchen/soundslider.swf?size=2&format=xml'|url }}" quality="high" bgcolor="#FFFFFF" width="400" height="299" name="soundslider" align="middle" menu="false" allowScriptAccess="always" type="application/x-shockwave-flash" allowFullScreen="true" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
					
					<p>
						The lush kitchen features new cabinets, a dining table for eight and a lengthy island for cooking and serving food. In the Nickless' previous home, there was little room for cooking and cabinet space was cramped. Now, they have new appliances, plenty of counter space and even drawers that are made to prevent slamming on people's fingers.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_studyPoly">
					<h4>Study</h4>
		
					<img src="{{ 'interactive/makeover/study1.jpg'|url }}" alt="study1" />
		
					<div><strong class="audioInfo">Audio:</strong> <script type="text/javascript" src="{{ 'flash/1pxout/audio-player.js'|url }}"></script>
					<object type="application/x-shockwave-flash" data="<?php echo Foundry::path( 'flash/1pxout/player.swf' ) ?>" id="audioplayer1" height="24" width="200">
					<param name="movie" value="{{ 'flash/1pxout/player.swf'|url }}">
					<param name="FlashVars" value="playerID=1&amp;soundFile={{ 'interactive/makeover/study.mp3'|url }}">
					<param name="quality" value="high">
					<param name="menu" value="false">
					<param name="wmode" value="transparent">
					</object></div>
		
					<p>
						One of Arlene's favorite rooms is the study adjacent to the foyer, where she is able to retreat for work and quiet time. It's here that she takes care of paperwork, bills and other household chores.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_bedrm2Poly">
					<h4>Bedroom</h4>
					
					<img src="{{ 'interactive/makeover/bedroom1_1.jpg'|url }}" alt="bedroom 1" />
					
					<br /><br />
					
					<img src="{{ 'interactive/makeover/bedroom1_2.jpg'|url }}" alt="bedroom 1" />
		
					<p>
						The Nickless' youngest son, Andrew, had a bed built in the shape of a P-38 Lightning airplane, a favorite of his and Tim's. The room also has a large desk for Andrew to construct his Legos, many of which are sprawled across the table.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_bedrm1Poly">
					<h4>Bedroom</h4>
					
					<img src="{{ 'interactive/makeover/bedroom2_1.jpg'|url }}" alt="bedroom 2" />
					
					<p>
						The middle of Tim and Arlene's sons, Noah, has a spaceship-shaped loft bed created out of PVC pipes. Beneath the bed is a television and XBox on which the boys like to play Halo 3 on a large-screen TV.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_bedrm4Poly">
					<h4>Bedroom</h4>
					
					<img src="{{ 'interactive/makeover/bedroom4_1.jpg'|url }}" alt="bedroom 4" />
					
					<br /><br />
					
					<img src="{{ 'interactive/makeover/bedroom4_2.jpg'|url }}" alt="bedroom 4" />
		
		
					<div><strong class="audioInfo">Audio:</strong>
					<object type="application/x-shockwave-flash" data="{{ 'flash/1pxout/player.swf'|url }}" id="audioplayer2" height="24" width="200">
					<param name="movie" value="{{ 'flash/1pxout/player.swf'|url }}">
					<param name="FlashVars" value="playerID=2&amp;soundFile={{ 'interactive/makeover/bedroom4.mp3'|url }}">
					<param name="quality" value="high">
					<param name="menu" value="false">
					<param name="wmode" value="transparent">
					</object></div>
		
					<p>
						Tim and Arlene's oldest son, Aaron, made one request for his room: He wanted something hidden from plain sight. He got that wish with a mysterious side room that can be covered by a large bookcase, and also received an atom smasher to go along with his love for engineering.
					</p>
				</div>
				<div class="infoContainer" id="infoBox_mstrBedrmPoly">
					<h4>Master Bedroom</h4>
					
					
					<img src="{{ 'interactive/makeover/master_2.jpg'|url }}" alt="master" />
		
					<p>
						Arlene's sanctuary is lined with a wood-patterned design on the walls and a serene backsplash of flowers behind the bed. A telescope faces a window in the corner of the room, a reminder of Tim's affection for stargazing.
					</p>
				</div>
		
			</div>
		
			<br /><br />
			<div style="font-size:.8em;">Source: The State News&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;Produced by Online Design &amp; Development</div>
		{% include 'gryphon/page/interactive/footer.tpl' %}

	</div>
	<div class="grid_4">
		
		{% include 'gryphon/main/sidebar-standard.tpl' %}
		
	</div>
	
	<hr class="spacer" />
	
{% endblock %}