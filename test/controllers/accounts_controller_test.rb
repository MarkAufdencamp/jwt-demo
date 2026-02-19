require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @domain = domains(:one)
    @account = accounts(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
    @headers = { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get domain_accounts_url(@domain), headers: @headers, as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @domain.accounts.count, json_response.size
  end

  test "should create account" do
    assert_difference("Account.count") do
      post domain_accounts_url(@domain),
           params: { account: { username: "new_account", email: "new@example.com", password: "password", password_confirmation: "password" } },
           headers: @headers, as: :json
    end
    assert_response :created
  end

  test "should show account" do
    get domain_account_url(@domain, @account), headers: @headers, as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @account.username, json_response["username"]
  end

  test "should update account" do
    patch domain_account_url(@domain, @account),
          params: { account: { username: "updated_username" } },
          headers: @headers, as: :json
    assert_response :success
    @account.reload
    assert_equal "updated_username", @account.username
  end

  test "should destroy account" do
    assert_difference("Account.count", -1) do
      delete domain_account_url(@domain, @account), headers: @headers, as: :json
    end
    assert_response :no_content
  end

  test "should not access other user's domain accounts" do
    other_user = users(:two)
    other_domain = domains(:two)
    get domain_accounts_url(other_domain), headers: @headers, as: :json
    assert_response :not_found
  end

  test "should not access other user's account" do
    other_domain = domains(:two)
    other_account = accounts(:two)
    get domain_account_url(other_domain, other_account), headers: @headers, as: :json
    assert_response :not_found
  end
end
