require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { email: "newuser@example.com", password: "password123", username: "newuser" } }, as: :json
    end

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal "newuser", json_response["username"]
    assert_equal "newuser@example.com", json_response["email"]
    assert_nil json_response["password_digest"]
  end

  test "should return error for invalid user" do
    assert_no_difference("User.count") do
      post users_url, params: { user: { email: "invalid", password: "password123", username: "" } }, as: :json
    end

    assert_response :unprocessable_entity
    json_response = JSON.parse(response.body)
    assert_not_empty json_response["errors"]
  end
end
