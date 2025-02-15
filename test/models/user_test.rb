require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with valid email should be valid" do
    user = User.new(email: "test@test.com", password_digest: "password_digest")
    assert user.valid?
  end

  test "user with invalid email is invalid" do
    user = User.new(email: "test", password_digest: "pwsd")
    assert_not user.valid?
  end

  test "user with taken email should be invalid" do
    other_user = users(:one)
    user = User.new(email: other_user.email, password_digest: "test")
    assert_not user.valid?
  end

  test "destroy user should destroy liked product" do
    assert_difference("Product.count", -1) do
      users(:one).destroy
    end
  end
end
