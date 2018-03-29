require 'test_helper'

class Admin::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_index_url
    assert_response :success
  end

end
