require "test_helper"

class AccountTest < ActiveSupport::TestCase
  setup do
    @domain = domains(:one)
    @account = Account.new(
      domain: @domain,
      username: "testuser",
      email: "test@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
  end

  test "should be valid with all attributes" do
    assert @account.valid?
  end

  test "username should be present" do
    @account.username = ""
    assert_not @account.valid?
  end

  test "email should be present" do
    @account.email = ""
    assert_not @account.valid?
  end

  test "username should be unique within domain scope" do
    duplicate_account = @account.dup
    @account.save
    assert_not duplicate_account.valid?
    
    # Different domain should be valid
    duplicate_account.domain = domains(:two)
    assert duplicate_account.valid?
  end

  test "should have secure password" do
    @account.password = @account.password_confirmation = ""
    assert_not @account.valid?
  end

  test "password should match confirmation" do
    @account.password_confirmation = "mismatch"
    assert_not @account.valid?
  end
end
