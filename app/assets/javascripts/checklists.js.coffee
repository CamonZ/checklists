# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@$(document).ready ->
  $("#yes_no_question_add").click (e) =>
    amount_of_children = $(".checklist_form").find(".form-group").length
    template = HoganTemplates['checklists/_new_question'].render({"number": (amount_of_children - 1)})
    $(template).insertBefore(".checklist_form > #submit_button.btn")

    $(".checklist_form > .form-group:last-of-type .remove_question_button").click (e) ->
      e.preventDefault()
      e.stopPropagation()
      $(@).unbind('click')
      $(@).parents(".form-group").remove()
      @
    @
  @
