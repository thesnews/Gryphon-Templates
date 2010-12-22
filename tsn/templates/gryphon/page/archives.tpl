{% extends "gryphon/base.tpl" %}
{% block title %}:: Archives{% endblock %}


{% block active %}{% endblock %}
{% block subActive %}{% endblock %}

{% block content %}

<div class="grid_8">
	<h1>Archives</h1>

	<p>The State News provides full access to content dating back to September 2000. If you have questions or concerns, please send us a message.</p>

<p><strong>Important Note:</strong> While the State News does correct factual errors in our archive, it is our policy to not remove items from our database for any reason.</p>


	<h3 class="gray box">Basic Search</h3>
	<p>Perform a basic search of the State News' archives. We will search from September 2000 forward.</p>
		
		<form method="get" action="/index.php/search/">
		<input type="text" name="q" value="" />
		<input type="submit" value="Search" />
	</form>
	
	
	<hr class="spacer" />
	
	<h3 class="gray box">Quick Date Search</h3>
	
	<form method="get" action="/index.php/search/" class="search-advanced">
		<input type="hidden" name="a" value="1" />
				
		<fieldset id="from_to_date1" class="noborder">
			<div>
				<label>From:</label>
				<select name="ts_month">
											<option value="0" selected="selected">Month</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
									</select>
				<select name="ts_day">
					<option value="0">Day</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
				<select name="ts_year">
				<option value="0">Year</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
								</select>
			</div>
			
			<div>
				<label>To:</label>
				<select name="te_month">
											<option value="0" selected="selected">Month</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
									</select>
				<select name="te_day">
				<option value="0">Day</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
				<select name="te_year">
				<option value="0">Year</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
								</select>
			</div>
			
		</fieldset>
		
		
		<input type="submit" value="Search" />
	</form>

<hr class="spacer" />

<h3 class="gray box">Advanced Search</h3>

<p>Perform an advanced search of the State News' archives. You may specify a date range. If no range is supplied, we will search from September 2000 forward.</p>

<form method="get" action="/index.php/search/" class="search-advanced">
		<input type="hidden" name="a" value="1" />
		<div id="form_left">
		<fieldset class="noborder" id="find_headline">
			<div>
				<label for="input_search">Find:</label>
				<input type="text" id="input_search" name="s" size="30" value=""  />
			</div>
			<div>
				<label for="input_title">Headline:</label>
				<input type="text" id="input_title" name="ti" size="30" value=""/>
			</div>
		</fieldset>
		<fieldset class="noborder" id="writer_tagged">
			<div>
				<label for="input_author">Writer/Photographer:</label>
				<input type="text" id="input_author" name="au" size="30" value="" />
			</div>

			<div>
				<label for="input_tag">Tagged:</label>
				<input type="text" id="input_tag" name="tg" size="30" value="" />
			</div>
			
		</fieldset>
	
	
	
		
		</div>
		<div id="form_right">
		<fieldset class="noborder" id="from_to_date2">
			<div>
				<label>From:</label>
				<select name="ts_month">
											<option value="0" selected="selected">Month</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
									</select>
				<select name="ts_day">
					<option value="0">Day</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
				<select name="ts_year">
				<option value="0">Year</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
								</select>
			</div>
			
			<div>
				<label>To:</label>
				<select name="te_month">
											<option value="0" selected="selected">Month</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
									</select>
				<select name="te_day">
				<option value="0">Day</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
				<select name="te_year">
				<option value="0">Year</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
									<option value="2007">2007</option>
									<option value="2008">2008</option>
									<option value="2009">2009</option>
									<option value="2010">2010</option>
								</select>
			</div>
			
		</fieldset>
		<fieldset class="noborder" id="type_order">
			<div>
				<label for="input_type">Type:</label>
				<select name="ty" id="input_type">
					<option value="0">Any</option>
					<option value="article" >Article</option>
					<option value="media" >Media</option>
				</select>
			</div>
			
			<div>
				<label for="input_order">Order by:</label>
				<select name="o" id="input_order">
					<option value="date" >Date</option>
					<option value="title" >Title</option>
				</select>
			</div>
		</fieldset>
		</div>
		<div class="clear"></div>
		<div id="form_submit"><input type="submit" value="Submit Search Query" /></div>
	</form>
	
</div>

<div class="grid_4">
	{% include 'gryphon/main/sidebar-standard.tpl' %}
</div>

<div class="clear"></div>

{% endblock content %}