$ ->
  $('.add-favourites-link').click((e) ->
    classStarOn = $(e.target).hasClass('star-on')
    product_id = $(e.target).parent().data('product-id')
    user_id = $(e.target).parent().data('user-id')
    $.ajax
      type: if classStarOn then 'DELETE' else 'POST'
      url: '/favourite_products/' 
      data: { product_id: product_id, user_id: user_id}
      context: this
      success: (data, textStatus, jqXHR) ->
        $(this).children('div').toggleClass('star-on').toggleClass('star-off')
      error: (textStatus, jqXHR, errorThrown) ->
        alert('refresh page and try again.');
    )
