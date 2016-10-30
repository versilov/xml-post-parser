require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get static_new_url
    assert_response :success
  end

end
