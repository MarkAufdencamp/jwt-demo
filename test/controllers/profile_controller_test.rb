require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
  end

  test "should get profile when authenticated" do
    get profile_url, headers: { "Authorization" => "Bearer #{@token}" }, as: :json
    assert_response :success
    
    json_response = JSON.parse(response.body)
    assert_equal @user.username, json_response["username"]
    assert_equal @user.email, json_response["email"]
  end

  test "should return unauthorized without token" do
    get profile_url, as: :json
    assert_response :unauthorized
  end

  test "should return unauthorized with invalid token" do
    get profile_url, headers: { "Authorization" => "Bearer invalid" }, as: :json
    assert_response :unauthorized
  end
end
