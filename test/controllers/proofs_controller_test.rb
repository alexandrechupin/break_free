require 'test_helper'

class ProofsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get proofs_new_url
    assert_response :success
  end

  test "should get create" do
    get proofs_create_url
    assert_response :success
  end

  test "should get index" do
    get proofs_index_url
    assert_response :success
  end

end
