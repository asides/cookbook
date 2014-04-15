# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# On Document Load Ready
ready = ->

  addTab = (item) ->
    pageId = new Date().getTime()
    
    $("#pageTab").append $("<li><a class='link-tab' href='#page" + pageId + "'>" + "Ингредиенты&nbsp;<button class=\"close\" title=\"Remove this page\" type=\"button\">×</button>" + "</a></li>")
    
    $(item).attr('id','page'+pageId)
    
    $("#pageTab a[href=#page"+pageId+"]").tab('show')
    return
  
  $("#pageTab").on "click", "a.link-tab .close", (e) ->
    e.preventDefault()
    tabId = $(this).parents("li").children("a").attr("href")
    $(tabId + " a.remove_fields").click()
    $(this).parents("li").remove "li"
    $("#pageTab a.link-tab:first").tab "show"
    return  

  $("#pageTab").on "click", "a.link-tab", (e) ->
    e.preventDefault()
    unless $(e.target).hasClass("close")
      $(this).tab "show"
    
    return

  ingredients = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 12
    prefetch:
      url: '/search_ingredient.json'
      ttl: '1'
      filter: (list) ->
        $.map list, (ingr) ->
          name: ingr
  )

  ingredients.initialize()
  
  $("#ingredient_lists .ingredient").typeahead null,
    name: "ingredients"
    displayKey: "name"
    source: ingredients.ttAdapter()
  
  $("#ingredient_lists").on "cocoon:after-insert", (e, insertedItem) ->
    if $(e.target).hasClass('tab-content')
      addTab(insertedItem)
    $("input.ingredient", insertedItem).typeahead null,
      name: "ingredients"
      displayKey: "name"
      source: ingredients.ttAdapter()
    return
  
  $(".fileinput").on( "clear.bs.fileinput", (e) ->
    $("input[id*=remove_image]", this).val("1")
  ).on( "change.bs.fileinput", (e) ->
    $(this).next("input[id*=remove_image]").val("0")

  ).on "reset.bs.fileinput", (e) ->
    $(this).next("input[id*=remove_image]").val("1")

    return

  $("form.simple_form").on "keyup keypress", (e) ->
    code = e.keyCode or e.which
    if code is 13
      e.preventDefault()
      false 
  
  f_tab = $("#ingredient_lists .tab-pane:first")
  f_tab.addClass("in active")
  if f_tab.attr("id") == "page"
    f_tab.attr("id", "page1")
    
  return

$(document).ready(ready)
$(document).on('page:load', ready)