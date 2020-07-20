require_relative './part_1_solution.rb'
require "pry"
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    redeem = find_item_by_name_in_collection(coupon[:item], cart)
    original = redeem.clone
    if redeem
      if redeem[:count] == coupon[:num]
        redeem[:item] = "#{redeem[:item]} W/COUPON"
        redeem[:price] = coupon[:cost]/coupon[:num]
        redeem[:count] = coupon[:num]
        cart.delete(original)
        cart << redeem
        original[:count] = 0
        cart << original
      elsif redeem[:count] > coupon[:num]
        original[:count] -= coupon[:num]
        redeem[:item] = "#{redeem[:item]} W/COUPON"
        redeem[:price] = coupon[:cost]/coupon[:num]
        redeem[:count] = coupon[:num]
        cart.delete(original)
        cart << original
        cart << redeem
       end
    end
  end
  
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item|
    if item[:clearance]
      item[:price] *= (0.8)
    end
  end
  cart
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
  
  consolidate_cart(cart)
  apply_coupons(cart,coupons)
  apply_clearance(cart)
  sum = add_up(cart)
  return sum 
end

def add_up(cart)
  sum = 0
  cart.each do |item|
    sum+= (item[:price] * item[:count])
    # binding.pry
  end
  sum
end