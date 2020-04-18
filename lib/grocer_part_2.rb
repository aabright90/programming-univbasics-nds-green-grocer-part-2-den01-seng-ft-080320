require_relative './part_1_solution.rb'
require 'pry'
def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart = []
  new_cart_item_with_coupon = {}
  cart_item = {}
  if coupons
    coupons.each do |coupon|
      cart.each do |item|
      # binding.pry
        if item[:item] == coupon[:item] && item[:count] >= coupon[:num]
          new_count = item[:count] - coupon[:num]
          new_cart_item_with_coupon = {
            :item => "#{item[:item]} W/COUPON",
            :price => coupon[:cost] / coupon[:num],
            :clearance => item[:clearance],
            :count => coupon[:num]
          }
          item[:count] = new_count
          cart << new_cart_item_with_coupon
        end
      end
    end
  end
  return cart
end
#
def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  new_cart = []
  cart.each do |item|
    if item[:clearance] == true
      item[:price] -= (item[:price] * 0.20)
      new_cart << item
    end
  end
  new_cart
  # binding.pry
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
  total = 0
  consolidate_cart(cart).each do |item|
    total += item[:price]
    # binding.pry
  end
  total
end
