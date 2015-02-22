module ProductsHelper

  def user_favourite_product?(user, product)
    user.favourite_products.find_by(product_id: product.id).present? if current_user
  end

  def star_state_class(user, product) 
    user_favourite_product?(user, product) ? 'star-on' : 'star-off'
  end
end
