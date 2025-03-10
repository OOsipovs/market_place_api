require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should have a positive price" do
    product = products(:one)
    product.price = -1
    assert_not product.valid?
  end

  test "should filter products by name" do
    assert_equal 2, Product.filter_by_title("tv").count
  end

  test "should filter products by name and test them" do
    assert_equal [ products(:another_tv), products(:one) ], Product.filter_by_title("tv").sort
  end

  test "should filter products by price and filter them" do
    assert_equal [ products(:two), products(:one) ], Product.above_or_equal_to_price(200).sort
  end

  test "should filter products by lower price and sort them" do
    assert_equal [ products(:two), products(:one) ], Product.above_or_equal_to_price(200).sort
  end

  test "should sort product by most recent" do
    products(:two).touch
    assert_equal [ products(:one), products(:another_tv), products(:two) ], Product.recent.to_a
  end
end
