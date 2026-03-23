require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
    assert_select "h1", "JWT Demo API"
    assert_select "section#product-overview"
    assert_select "section#api-docs"
    assert_select "section#auth-ctas"
  end
end
