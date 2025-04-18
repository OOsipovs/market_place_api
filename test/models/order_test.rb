require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
    @product1 = products(:one)
    @product2 = products(:two)
  end

  test "build two placements for an order" do
    @order.build_placements_with_product_ids_and_quantities [ { product_id: @product1.id, quantity: 2 }, { product_id: @product2.id, quantity: 3 } ]
    assert_difference("Placement.count", 2) do @order.save end
  end

  # test "should set total" do
  #   order = Order.new user_id: @order.user_id
  #   order.products << @product1
  #   order.products << @product2
  #   order.save

  #   assert_equal (@product1.price + @product2.price), order.total
  # end

  # test "should have a positive total" do
  #   order = orders(:one)
  #   order.total = -1
  #   assert_not order.valid?
  # end
end
