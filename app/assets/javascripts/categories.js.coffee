# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  removeDuplicates = (ar) ->
    res = {}
    res[ar[key]] = ar[key] for key in [0..ar.length-1]
    value for key, value of res

	# $("#categories select").on "ajax:success", (e, data, status, xhr) ->
 #    console.log "category added."
  $('#add_category').on "click", (e) ->
    e.preventDefault()
    # id = $("#categories option:selected").not(':empty').last().val()
    # console.log id
    # val = $("input[name='recipe[category_ids][]']").val().split(",")
    # console.log removeDuplicates(val)
    # $("input[name='recipe[category_ids][]']").val(val+","+id)
    console.log $("input[name='recipe[category_ids][]']").val()
  
  $("#categories").on "change", "select", (e) ->
    $.ajax({
      type: "POST",
      url: "/categories/nested",
      data: { id: this.value },
      beforeSend: ->
        $(e.target).nextAll("select").remove()    	
      success:(data) ->
        $("select:last", $(e.target).parent('div')).after(data)
        
        id = $("option:selected", $(e.target).parent('div')).not(':empty').last().val()

        $("input.category_id", $(e.target).parent('div')).val(id)
        return false
      error:(data) ->
        return false
    })
	# $("#recipe_category_ids").select2 placeholder: "Выберите категории"
	# return

$(document).ready(ready)
$(document).on('page:load', ready)