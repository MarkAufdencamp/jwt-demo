require "test_helper"

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should authenticate with valid credentials" do
    post authenticate_url, params: { username: @user.username, password: "password123" }, as: :json
    assert_response :success
    
    json_response = JSON.parse(response.body)
    assert_not_nil json_response["token"]
    assert_not_nil json_response["expires_at"]
  end

  test "should not authenticate with invalid password" do
    post authenticate_url, params: { username: @user.username, password: "wrongpassword" }, as: :json
    assert_response :unauthorized
    
    json_response = JSON.parse(response.body)
    assert_equal "unauthorized", json_response["error"]
  end

  test "should not authenticate with invalid username" do
    post authenticate_url, params: { username: "nonexistent", password: "password123" }, as: :json
    assert_response :unauthorized
  end
end