!function(t){"use strict";function e(t){return"chip"}function i(t){return t?t.toString():t}function a(t){return this.itemValue(t)}function n(t){return null}function r(t,e){e.hide().fadeIn()}function o(e,i){this.itemsArray=[],this.$element=t(e),this.$element.hide(),this.objectItems=i&&i.itemValue,this.placeholderText=e.hasAttribute("placeholder")?this.$element.attr("placeholder"):"",this.inputSize=Math.max(1,this.placeholderText.length),this.$container=t('<div class="materialize-tags"></div>'),this.$input=t('<input type="text" class="n-tag"  placeholder="'+this.placeholderText+'"/>').appendTo(this.$container),this.$label=this.$element.parent().find("label"),this.$element.before(this.$container),this.build(i),this.$label.on("click",function(){t(this).addClass("active"),t(this).next(".materialize-tags").find("input.n-tag").focus()}),this.$input.on("focus",function(){var e=t(this).parents(".materialize-tags").parent().find("label");t(this).parents(".materialize-tags").addClass("active"),e.hasClass("active")||e.addClass("active")}).on("focusout",function(){var e=t(this).parents(".materialize-tags"),i=e.find("span.chip");e.removeClass("active"),0==i.length&&0==t(this).val().length&&e.parent().find("label").removeClass("active")})}function s(t,e){if("function"!=typeof t[e]){var i=t[e];t[e]=function(t){return t[i]}}}function l(t,e){if("function"!=typeof t[e]){var i=t[e];t[e]=function(){return i}}}function p(t){return t?m.text(t).html():""}function u(t){var e=0;if(document.selection){t.focus();var i=document.selection.createRange();i.moveStart("character",-t.value.length),e=i.text.length}else(t.selectionStart||"0"==t.selectionStart)&&(e=t.selectionStart);return e}function c(e,i){var a=!1;return t.each(i,function(t,i){if("number"==typeof i&&e.which===i)return a=!0,!1;if(e.which===i.which){var n=!i.hasOwnProperty("altKey")||e.altKey===i.altKey,r=!i.hasOwnProperty("shiftKey")||e.shiftKey===i.shiftKey,o=!i.hasOwnProperty("ctrlKey")||e.ctrlKey===i.ctrlKey;if(n&&r&&o)return a=!0,!1}}),a}var h={tagClass:e,itemValue:i,itemText:a,itemTitle:n,freeInput:!0,addOnBlur:!0,maxTags:void 0,maxChars:void 0,confirmKeys:[9,13,44,188],onTagExists:r,trimValue:!0,allowDuplicates:!1,deleteTagsOnBackspace:!0,deleteTagsOnDeleteKey:!0,MoveTagOnLeftArrow:!0,MoveTagOnRightArrow:!0,autoselect:!1,CapitalizeFirstLetterOnly:!1,prefilled:null};o.prototype={constructor:o,add:function(e,i,a){var n=this;if(!(n.options.maxTags&&n.itemsArray.length>=n.options.maxTags)&&(e===!1||e)){if("string"==typeof e&&n.options.trimValue&&(e=t.trim(e)),"string"==typeof e&&n.options.CapitalizeFirstLetterOnly&&(e=e.charAt(0).toUpperCase()+e.slice(1)),"object"==typeof e&&!n.objectItems)throw"Can't add objects when itemValue option is not set";if(!e.toString().match(/^\s*$/)){if("string"==typeof e&&"INPUT"===this.$element[0].tagName){var r=e.split(",");if(r.length>1){for(var o=0;o<r.length;o++)this.add(r[o],!0);return void(i||n.pushVal())}}var s=n.options.itemValue(e),l=n.options.itemText(e),u=n.options.tagClass(e),c=n.options.itemTitle(e),h=t.grep(n.itemsArray,function(t){return n.options.itemValue(t)===s})[0];if(!h||n.options.allowDuplicates){if(!(n.items().toString().length+e.length+1>n.options.maxInputLength)){var m=t.Event("beforeItemAdd",{item:e,cancel:!1,options:a});if(n.$element.trigger(m),!m.cancel){n.itemsArray.push(e);var f=t('<span class="'+p(u)+(null!==c?'" title="'+c:"")+'">'+p(l)+'<i class="material-icons" data-role="remove">close</i></span>');f.data("item",e),n.findInputWrapper().before(f),f.after(" "),i||n.pushVal(),n.options.maxTags!==n.itemsArray.length&&n.items().toString().length!==n.options.maxInputLength||(n.$container.addClass("materialize-tags-max"),n.$input.blur(),n.$input.prop("readOnly",!0)),n.$element.trigger(t.Event("itemAdded",{item:e,options:a}))}}}else if(n.options.onTagExists){var d=t(".tag",n.$container).filter(function(){return t(this).data("item")===h});n.options.onTagExists(e,d)}}}},remove:function(e,i,a){var n=this;if(n.objectItems&&(e="object"==typeof e?t.grep(n.itemsArray,function(t){return n.options.itemValue(t)==n.options.itemValue(e)}):t.grep(n.itemsArray,function(t){return n.options.itemValue(t)==e}),e=e[e.length-1]),e){var r=t.Event("beforeItemRemove",{item:e,cancel:!1,options:a});if(n.$element.trigger(r),r.cancel)return;t(".chip",n.$container).filter(function(){return t(this).data("item")===e}).remove(),t.inArray(e,n.itemsArray)!==-1&&n.itemsArray.splice(t.inArray(e,n.itemsArray),1)}i||n.pushVal(),n.options.maxTags>n.itemsArray.length&&(n.$container.removeClass("materialize-tags-max"),n.$input.prop("readOnly",!1)),0==n.itemsArray.length&&n.$input.siblings("label").first().removeClass("active"),n.$input.blur(),n.$element.trigger(t.Event("itemRemoved",{item:e,options:a}))},removeAll:function(){var e=this;for(t(".chip",e.$container).remove();e.itemsArray.length>0;)e.itemsArray.pop();e.pushVal(),e.$container.removeClass("materialize-tags-max"),e.$input.siblings("label").first().removeClass("active"),e.$input.prop("readOnly",!1),e.$input.blur()},refresh:function(){var e=this;t(".chip",e.$container).each(function(){var i=t(this),a=i.data("item"),n=(e.options.itemValue(a),e.options.itemText(a)),r=e.options.tagClass(a);i.attr("class",null),i.addClass("tag "+p(r)),i.contents().filter(function(){return 3==this.nodeType})[0].nodeValue=p(n)})},items:function(){return this.itemsArray},pushVal:function(){var e=this,i=t.map(e.items(),function(t){return e.options.itemValue(t).toString()});e.$element.val(i,!0).trigger("change"),e.$input.typeahead("val","")},build:function(e){var i=this;if(i.options=t.extend({},h,e),i.objectItems&&(i.options.freeInput=!1),s(i.options,"itemValue"),s(i.options,"itemText"),l(i.options,"tagClass"),i.options.typeaheadjs){var a=null,n={},r=i.options.typeaheadjs;t.isArray(r)?(a=r[0],n=r[1]):n=r,i.$input.typeahead(a,n).on("typeahead:selected",t.proxy(function(t,e){n.valueKey?i.add(e[n.valueKey]):i.add(e),i.$input.typeahead("val","")},i))}i.$container.on("click",t.proxy(function(t){i.$element.attr("disabled")||i.$input.removeAttr("disabled"),i.$input.focus()},i)),i.options.addOnBlur&&i.options.freeInput&&i.$input.on("focusout",t.proxy(function(t){i.add(i.$input.val())},i)),i.$container.on("keydown","input",t.proxy(function(e){var a=t(e.target),n=i.findInputWrapper();if(i.$element.attr("disabled"))return void i.$input.attr("disabled","disabled");switch(e.which){case 8:if(i.options.deleteTagsOnBackspace&&0===u(a[0])){var r=n.prev();r&&i.remove(r.data("item"))}break;case 46:if(i.options.deleteTagsOnDeleteKey&&0===u(a[0])){var o=n.next();o&&i.remove(o.data("item"))}break;case 37:var s=n.prev();i.options.MoveTagOnLeftArrow&&0===a.val().length&&s[0]&&(s.before(n),a.focus());break;case 39:var l=n.next();i.options.MoveTagOnRightArrow&&0===a.val().length&&l[0]&&(l.after(n),a.focus())}var p=a.val().length;Math.ceil(p/5);a.attr("size",Math.max(this.inputSize,a.val().length))},i)),i.$container.on("keydown","input",t.proxy(function(e){var a=t(e.target);if(i.$element.attr("disabled"))return void i.$input.attr("disabled","disabled");var n=a.val(),r=i.options.maxChars&&n.length>=i.options.maxChars;i.options.freeInput&&(c(e,i.options.confirmKeys)||r)&&(i.add(r?n.substr(0,i.options.maxChars):n),a.val(""),i.$input.typeahead&&i.$input.typeahead("val",""),e.preventDefault());var o=a.val().length;Math.ceil(o/5);a.attr("size",Math.max(this.inputSize,a.val().length))},i)),i.$container.on("click","[data-role=remove]",t.proxy(function(e){i.$element.attr("disabled")||i.remove(t(e.target).closest(".chip").data("item"))},i)),i.options.itemValue===h.itemValue&&"INPUT"===i.$element[0].tagName&&i.add(i.$element.val())},destroy:function(){var t=this;t.$container.off("keydown","input"),t.$container.off("click","[role=remove]"),t.$container.remove(),t.$element.removeData("materialtags"),t.$element.show()},focus:function(){this.$input.focus()},input:function(){return this.$input},findInputWrapper:function(){for(var e=this.$input[0],i=this.$container[0];e&&e.parentNode!==i;)e=e.parentNode;return t(e)}},t.fn.materialtags=function(e,i,a){var n=[];return this.each(function(){var r=t(this).data("materialtags");if(r)if(e||i){if(void 0!==r[e]){if(3===r[e].length&&void 0!==a)var s=r[e](i,null,a);else var s=r[e](i);void 0!==s&&n.push(s)}}else n.push(r);else r=new o(this,e),t(this).data("materialtags",r),n.push(r),t(this).val(t(this).val())}),"string"==typeof e?n.length>1?n:n[0]:n},t.fn.materialtags.defaults=h,t.fn.materialtags.Constructor=o;var m=t("<div />");t(function(){t("input[data-role=materialtags]").materialtags()})}(window.jQuery);
//# sourceMappingURL=materialize-tags.min.js.map

$(document).ready(function(){
 $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });


	// $('.chips').material_chip();
    // $('#chips-static-tags').material_chip({
    //     placeholder: 'Tags',
    //     secondaryPlaceholder: 'Add tag'
    // });

	$("#chips-static-tags").materialtags({
		maxTags: 6,
		trimValue: true,
		allowDuplicates: false,
		cancelConfirmKeysOnEmpty: true,
		typeahead: {
        source: ['Amsterdam', 'Washington', 'Sydney', 'Beijing', 'Cairo']
    }

	});


$('[name=rw]').change(function(){
        
        if($(this).val()=='we'){
				$('#wrap_path_choser').slideDown();
		}else{
$('#wrap_path_choser').slideUp();
		}


    })


$( "#new_article_form" ).submit(function( event ) {
  $('#tags').val($('#chips-static-tags').val());
//   event.preventDefault();
});



})




/**
 * Copyright (c) 2003-2017, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

/* exported initSample */

if ( CKEDITOR.env.ie && CKEDITOR.env.version < 9 )
	CKEDITOR.tools.enableHtml5Elements( document );

// The trick to keep the editor in the sample quite small
// unless user specified own height.
CKEDITOR.config.height = 150;
CKEDITOR.config.width = 'auto';

var initSample = ( function() {
	var wysiwygareaAvailable = isWysiwygareaAvailable(),
		isBBCodeBuiltIn = !!CKEDITOR.plugins.get( 'bbcode' );

	return function() {
		var editorElement = CKEDITOR.document.getById( 'editor' );

		// :(((
		if ( isBBCodeBuiltIn ) {
			editorElement.setHtml(
				'Hello world!\n\n' +
				'I\'m an instance of [url=http://ckeditor.com]CKEditor[/url].'
			);
		}

		// Depending on the wysiwygare plugin availability initialize classic or inline editor.
		if ( wysiwygareaAvailable ) {
			CKEDITOR.replace( 'editor' );
		} else {
			editorElement.setAttribute( 'contenteditable', 'true' );
			CKEDITOR.inline( 'editor' );

			// TODO we can consider displaying some info box that
			// without wysiwygarea the classic editor may not work.
		}
	};

	function isWysiwygareaAvailable() {
		// If in development mode, then the wysiwygarea must be available.
		// Split REV into two strings so builder does not replace it :D.
		if ( CKEDITOR.revision == ( '%RE' + 'V%' ) ) {
			return true;
		}

		return !!CKEDITOR.plugins.get( 'wysiwygarea' );
	}
} )();