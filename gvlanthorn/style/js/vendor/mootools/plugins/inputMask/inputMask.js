/*
Script: InputMask.js
	Allows masking of input elements

License:
	MIT-style license.

Authors:
	Christoph Pojer

*/

(function(){

var InputMask = this.InputMask = new Class({

	Implements: [Options, Events],

	options: {
		/*onKeypress: $empty,
		onError: $empty*/
		rules: {},
		mask: null
	},

	initialize: function(selector, options){
		this.setOptions(options);
		this.rules = $merge(this.options.rules, InputMask.lookupRules());
		this.keys = Hash.getKeys(this.rules);
		
		var self = this;
		this.fire = function(e){
			self.fireEvent(e.type)[e.type].apply(self, [e, this]);
		};

		this.attach(selector);
	},

	attach: function(selector){
		$$(selector).addEvents({
			keypress: this.fire
		});
		return this;
	},

	detach: function(selector){
		$$(selector).removeEvents({
			keypress: this.fire
		});
		return this;
	},

	keypress: function(e, element){
		var key = e.key.toLowerCase(), value = element.get('value');
		
		if (e.control || e.meta) return (e.key == 'a' || e.key == 'c');

		var range = element.getSelectedRange();
		if ($chk(range.start) && range.start != range.end){
			e.stop();
			element.set('value', value = value.substring(0, range.start) + value.substring(range.end, value.length));
		} else if (key == 'backspace'){
			e.stop();
			element.set('value', value.substring(0, value.length - 1));
			this.previous(element);
		}

		// Fixes weird keypress bug for % & / ( ' .
		if ((['right', 'up', 'down', 'left'].contains(key) && e.shift) || key == 'delete') e.stop();
		if (key.length > 1) return true
		
		var before = value;
		this.next(element);
		value = '' + element.get('value');

		e.stop();
		var current = this.options.mask.charAt(value.length),
			group = this.getPrevious(value, key);
		for (var i in this.rules){
			var rule = this.rules[i],
				result = ($type(rule) == 'function' ? rule(key, {
					element: element,
					value: value,
					position: value.length,
					group: group
				}) : key.test(rule));
			if (current == i && result){
				element.set('value', value + key);
				return true;
			}
		}
		
		this.next(element);
		if (before == element.get('value')) this.fireEvent('error', [element, key]);
	},

	getPrevious: function(value, key){
		var length = value.length, mask = this.options.mask;
		if (!value) return key;
		
		var group = [key], current = mask.charAt(length);
		for (var i = length; i--; ){
			if (mask.charAt(i) == current) group.push(value.charAt(i));
			else break;
		}
		
		return group.reverse().join('');
		
	},

	previous: function(element){
		var value = element.get('value'), length = value.length - 1, mask = this.options.mask;
		if (!value) return this;

		for (var i = length; i--; ){
			if (this.keys.contains(mask.charAt(length))) break;
			else element.set('value', value.substring(0, length));
		}
		
		return this;
	},
	
	next: function(element){
		var value = element.get('value'), length = value.length, mask = this.options.mask;
		if (mask.length <= length) return this;

		for (var i = length; i <= mask.length; i++){
			var current = mask.charAt(length);
			if (this.keys.contains(current)) break;
			else element.set('value', value + current);
		}

		return this;
	}

});

InputMask.extend({

	rules: {},

	defineRule: function(rule, chars){
		this.rules[rule] = chars;
		return this;
	},

	defineRules: function(rules){
		for (var i in rules) this.defineRule(i, rules[i]);
		return this;
	},

	lookupRule: function(rule){
		return rules[rule] || null;
	},

	lookupRules: function(rules){
		if (!rules) return this.rules;

		var result = {};
		rules.each(function(rule){
			result[rule] = this.rules[rule] || null;
		}, this);
		return result;
	},

	upTo: function(max){
		max = '' + max;
		return function(key, options){
			if (!options.group.test(/^\d+$/)) return false;
			
			return options.group <= max.substr(0, options.group.length);
		};
	}

}).defineRules((function(){
	var rules = {
		'0': /0/,
		a: /\w/,
		x: /(\w|\d)/
	};
	
	for (var i = 1; i <= 9; i++) rules[i] = new RegExp('[0-' + i + ']');

	return rules;
})());

InputMask.Time = new Class({

	Extends: InputMask,

	options: {
		rules: {
			h: InputMask.upTo(23)
		},
		mask: 'hh:59'
	}

});

InputMask.Date = new Class({

	Extends: InputMask,

	options: {
		rules: {
			m: InputMask.upTo(12),
			d: InputMask.upTo(31)
		},
		mask: 'mm/dd/2999'
	}

});

})();