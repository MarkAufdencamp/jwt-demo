require "test_helper"

class DomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
    @domain = domains(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
    @headers = { "Authorization" => "Bearer #{@token}" }
  end

  test "should get index" do
    get domains_url, headers: @headers, as: :json
    assert_response :success
  end

  test "should create domain" do
    assert_difference("Domain.count") do
      post domains_url, params: { domain: { domain: "newdomain", tld: "com" } }, headers: @headers, as: :json
    end

    assert_response :created
  end

  test "should show domain" do
    get domain_url(@domain), headers: @headers, as: :json
    assert_response :success
  end

  test "should update domain" do
    patch domain_url(@domain), params: { domain: { domain: "updated" } }, headers: @headers, as: :json
    assert_response :success
    @domain.reload
    assert_equal "updated", @domain.domain
  end

  test "should destroy domain" do
    assert_difference("Domain.count", -1) do
      delete domain_url(@domain), headers: @headers, as: :json
    end

    assert_response :no_content
  end

  test "should not access other user's domain" do
    other_domain = domains(:two)
    get domain_url(other_domain), headers: @headers, as: :json
    assert_response :not_found
  end
end