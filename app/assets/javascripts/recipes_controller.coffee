$ ->
  $select2 = $(".js-example-basic-single").select2()
  $select2.on("change", (e) ->
    li = "<li>" + e.val + "</li>"
    console.log li
    $("ul.ingredients-header").append(li)
    )
