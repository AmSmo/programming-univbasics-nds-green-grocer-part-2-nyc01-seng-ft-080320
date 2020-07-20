require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    redeem = find_item_by_name_in_collection(coupon[:item], cart)
    if redeem
      if redeem[:count] >= coupon[:num]
        discount = redeem
        redeem[:count] -= coupon[:num]
        if redeem[:count] == 0
          cart.delete(redeem)
        end
        discount[:count] = coupon[:num]
        discount[:item] = "#{coupon[:item]} W/COUPON"
        discount[:price] = coupon[:cost]/coupon[:num]
        cart << discount
      end
    end
    
    cart
  end
  
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
