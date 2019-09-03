require 'test_helper'

class TestimoniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testimonies_index_url
    assert_response :success
  end

  test "should get new" do
    get testimonies_new_url
    assert_response :success
  end

  test "should get create" do
    get testimonies_create_url
    assert_response :success
  end

  test "should get edit" do
    get testimonies_edit_url
    assert_response :success
  end

  test "should get update" do
    get testimonies_update_url
    assert_response :success
  end

  test "should get delete" do
    get testimonies_delete_url
    assert_response :success
  end

end
