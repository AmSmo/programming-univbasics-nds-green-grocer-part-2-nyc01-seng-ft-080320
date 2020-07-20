require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    redeem = find_item_by_name_in_collection(coupon[:item], cart)
    if redeem
      if redeem[:count] == coupon[:num]
        redeem[:item] = "#{redeem[:item]} W/COUPON"
        redeem[:price] = coupon[:cost]/coupon[:num]
        redeem[count] = coupon[:num]
      # elsif redeem[:count] > coupon[:num]
      #   discounted = redeem
      #   discounted[:count] = coupon[:num]
      #   redeem[:count] -= coupon[:num]
      #   discounted[:item] = "#{discounted[:item]} W/COUPON"
      #   discounted[:price] = coupon[:cost]/coupon[:num]
      #   cart << discounted
       end
    end
  end
  cart
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
