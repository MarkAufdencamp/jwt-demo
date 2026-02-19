require "test_helper"

class DomainTest < ActiveSupport::TestCase
  def setup
    @domain = domains(:one)
  end

  test "should be valid" do
    assert @domain.valid?
  end

  test "domain should be present" do
    @domain.domain = "   "
    assert_not @domain.valid?
  end

  test "tld should be present" do
    @domain.tld = "   "
    assert_not @domain.valid?
  end

  test "domain and tld combination should be unique" do
    duplicate_domain = @domain.dup
    @domain.save
    assert_not duplicate_domain.valid?
  end

    test "should belong to user" do

      assert_respond_to @domain, :user

      assert_instance_of User, @domain.user

    end

  

    test "should have many accounts" do

      assert_respond_to @domain, :accounts

    end

  

      test "should destroy associated accounts on destruction" do

  

        new_domain = User.first.domains.create!(domain: "temporary", tld: "com")

  

        new_domain.accounts.create!(username: "test", email: "test@example.com", password: "password", password_confirmation: "password")

  

        assert_difference "Account.count", -1 do

  

          new_domain.destroy

  

        end

  

      end

  

    

  end

  