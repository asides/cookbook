# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# On Document Load Ready
ready = ->
  console.log("start")
  addTab = (item) ->
    console.log("addTab function")
    pageId = new Date().getTime()
    
    $("#pageTab").append $("<li><a class='link-tab' href='#page" + pageId + "'>" + "Ингредиенты&nbsp;<button class=\"close\" title=\"Remove this page\" type=\"button\">×</button>" + "</a></li>")
    
    $(item).attr('id','page'+pageId)
    
    $("#pageTab a[href=#page"+pageId+"]").tab('show')
    return
  
  $("#pageTab").on "click", "a.link-tab .close", (e) ->
    e.preventDefault()
    console.log("pageTab click close")
    tabId = $(this).parents("li").children("a").attr("href")
    $(tabId + " a.remove_fields").click()
    $(this).parents("li").remove "li"
    $("#pageTab a.link-tab:first").tab "show"
    return  

  $("#pageTab").on "click", "a.link-tab", (e) ->
    e.preventDefault()
    console.log("pageTab click")
    unless $(e.target).hasClass("close")
      $(this).tab "show"
    
    return

  ingredients = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 12
    prefetch:
      url: '/search_ingredient'
      ttl: '1'
      filter: (list) ->       
        $.map list, (ingr) ->
          name: ingr
  )

  console.log(ingredients)
  ingredients.initialize()
  
  $("#ingredient_lists .ingredient").typeahead null,
    name: "ingredients"
    displayKey: "name"
    source: ingredients.ttAdapter()
  
  $("#ingredient_lists").on "cocoon:after-insert", (e, insertedItem) ->
    console.log("cocoon after-insert action")
    if $(e.target).hasClass('tab-content')
      addTab(insertedItem)
    $("input.ingredient", insertedItem).typeahead null,
      name: "ingredients"
      displayKey: "name"
      source: ingredients.ttAdapter()
    return
  
  $(".fileinput").on( "clear.bs.fileinput", (e) ->
    $("input[id*=remove_image]", this).val("1")
    console.log $("input[id*=remove_image]", this)
  ).on( "change.bs.fileinput", (e) ->
    $(this).next("input[id*=remove_image]").val("0")

  ).on "reset.bs.fileinput", (e) ->
    $(this).next("input[id*=remove_image]").val("1")

    return

  #####
  #

 

  #
  #####  

  $("form.simple_form").on "keyup keypress", (e) ->
    code = e.keyCode or e.which
    if code is 13
      e.preventDefault()
      false 
  
  console.log("break") 
  f_tab = $("#ingredient_lists .tab-pane:first")
  f_tab.addClass("in active")
  if f_tab.attr("id") == "page"
    f_tab.attr("id", "page1")
    
  return

$(document).ready(ready)
$(document).on('page:load', ready)





# $ ->
	
#   toggleAddLink = ->
#     $addLink.toggle fieldsCount <= maxFieldsCount
#     return
  
#   $("#idr .tab-pane:first").attr({class: 'active fields tab-pane', id: 'ingr_1'})
#   $(document).on "click", "button.del_list", ->

#   	target_field = $(this).parent("a").attr('href')

#   	$(target_field+"a.del_list").click
#   	#$(this).parents("li").hide()

#   fieldsCount = undefined
#   maxFieldsCount = 99
  
#   $addLink = $("a.add_nested_fields")
  
#   $(document).on "nested:fieldAdded", ->
#     fieldsCount += 1

#     # new_li = $("li.adding_new_list").before("<li><a data-toggle='tab' href='#ingr_"+fieldsCount+"'>Ингредиенты</a></li>")
    
#     # $("#idr .tab-pane:last").attr('id','ingr_'+fieldsCount)
#     #new_li.html("<a href='#'>Ингредиенты</a>")

#     # if fieldsCount > 1
#     # 	$("form .fields")
    
#     toggleAddLink()
#     return

#   $(document).on "nested:fieldRemoved", ->
#     fieldsCount -= 1
#     toggleAddLink()
#     return

  
#   # count existing nested fields after page was loaded
#   fieldsCount = $("form .fields").length
#   toggleAddLink()
#   return