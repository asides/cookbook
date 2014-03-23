# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	
	$("#recipe_category_ids").select2 placeholder: "Выберите категории"
	return

$(document).ready(ready)
$(document).on('page:load', ready)