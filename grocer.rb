def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  collection.each do |item|
    if item[:item] == name
      return item
    end
  end
  return nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  new_arr = []
  has_item = false
  cart.each do |item|
    new_arr.each do |new_arr_item|
      if new_arr_item[:item] == item[:item]
        new_arr_item[:count] += 1
        has_item = true
      end
    end
    has_item ? has_item = false : item[:count] = 1 and new_arr.push(item) and has_item = false
  end
  return new_arr
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  items_with_coupon = 0
  items_without_coupon = 0
  cart.each do |item|
    coupons.each do |coupon|
      if item[:item] == coupon[:item]
        items_without_coupon = item[:count] % coupon[:num]
        items_with_coupon = item[:count] - items_without_coupon
        item[:count] = items_without_coupon
        cart.push({
          :item => item[:item] + " W/COUPON",
          :price => coupon[:cost] / coupon[:num],
          :count => items_with_coupon,
          :clearance => item[:clearance]
        })
      end
    end
    #items_without_coupon == 0 and items_with_coupon > 0 ? cart.delete(item) : nil
    items_with_coupon = 0
    items_without_coupon = 0
  end
  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
