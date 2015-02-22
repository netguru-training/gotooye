ready = ->
  $select2 = $(".js-example-basic-single").select2()
  $select2.on("change", (e) ->
    product_id = $(e.target).find(':selected').val()
    $.ajax
      url: "/ingredient-template/" + product_id
      dataType: "html"
      success: (data, textStatus, jqXHR) ->
        $("ul.ingredients-header").append(data)
  )

  $('.update-recipe-form').on 'submit', (e) ->
    e.preventDefault()
    console.log $(e.target)
    paramz = copyAndPaste($(e.target))
    url = $(e.target).attr('action')
    $.ajax
      url: url
      type: "PUT"
      data: paramz
      error: ->
        sweetAlert("Something went wrong... Check validations!")
      success: ->
        window.location.href = "/recipes"

  $('.create-recipe-form').on 'submit', (e) ->
    e.preventDefault()
    paramz = copyAndPaste($(e.target))
    console.log 'dupa'
    $.ajax
      url: "/recipes"
      type: "POST"
      data: paramz
      error: ->
        sweetAlert("Something went wrong... Check validations!")
      success: ->
        window.location.href = "/recipes"

  copyAndPaste = ($form) ->
    name = $form.find('#recipe_name').val()
    desc = $form.find('#recipe_desc').val()
    servings_arr = []
    $('ul.ingredients-header').find('li').each ->
      serving_count = $(this).find('#serving_count').val()
      serving_id = $(this).find('#serving_id').val()
      product_id = $(this).find('#product_id').val()
      servings_arr.push {
        id: null
        serving_id: serving_id
        serving_count: serving_count
        product_id: product_id
      }
    attributes = {
      recipe: {
        name: name
        desc: desc
        recipe_products_attributes: servings_arr
      }
    }
    attributes

$(document).ready(ready)
$(document).on('page:load', ready)
