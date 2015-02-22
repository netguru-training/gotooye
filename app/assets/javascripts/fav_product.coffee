$ ->
  starClickHandler = (e) ->
    classStarOn = $(e.target).hasClass('star-on')
    product_id = $(e.target).parent().data('product-id')
    user_id = $(e.target).parent().data('user-id')
    $.ajax
      type: if classStarOn then 'DELETE' else 'POST'
      url: '/favourite_products/' 
      data: { product_id: product_id, user_id: user_id}
      context: this
      success: (data, textStatus, jqXHR) ->
        selector = '.add-favourites-link[data-product-id=' + product_id + ']'
        $(selector).children('div').toggleClass('star-on').toggleClass('star-off')
        # $(this).children('div').toggleClass('star-on').toggleClass('star-off')
        $.ajax
          type: 'GET'
          url: '/favourite_products/' + user_id
          dataType: 'html'
          success: (data, textStatus, jqXHR) ->
            $('#fav-products').empty().append(data)
            $('#fav-products .add-favourites-link').click(starClickHandler)
      error: (textStatus, jqXHR, errorThrown) ->
        alert('refresh page and try again.')
  $('.add-favourites-link').click(starClickHandler)
