require 'test_helper'

class NonprofitsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nonprofits_index_url
    assert_response :success
  end

end
