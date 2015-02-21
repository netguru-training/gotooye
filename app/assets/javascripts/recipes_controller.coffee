$ ->
  $select2 = $(".js-example-basic-single").select2()
  $select2.on("change", (e) ->
    product_id = $(e.target).find(':selected').val()
    $.ajax
      url: "/ingredient-template/" + product_id
      dataType: "html"
      success: (data, textStatus, jqXHR) ->
        $("ul.ingredients-header").append(data)
  )
