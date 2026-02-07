require "test_helper"

class AuthFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user_params = { user: { username: "flowuser", email: "flow@example.com", password: "password123", password_confirmation: "password123" } }
  end

  test "full authentication flow: register, login, access profile" do
    # 1. Register
    post users_url, params: @user_params, as: :json
    assert_response :created
    
    # 2. Login
    post authenticate_url, params: { username: "flowuser", password: "password123" }, as: :json
    assert_response :success
    json_response = JSON.parse(response.body)
    token = json_response["token"]
    assert_not_nil token
    
    # 3. Access Profile
    get profile_url, headers: { "Authorization" => "Bearer #{token}" }, as: :json
    assert_response :success
    profile_response = JSON.parse(response.body)
    assert_equal "flowuser", profile_response["username"]
    assert_equal "flow@example.com", profile_response["email"]
  end
end
