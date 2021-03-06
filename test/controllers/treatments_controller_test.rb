require 'test_helper'

class TreatmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get treatments_index_url
    assert_response :success
  end

  test "should get new" do
    get treatments_new_url
    assert_response :success
  end

  test "should get create" do
    get treatments_create_url
    assert_response :success
  end

  test "should get edit" do
    get treatments_edit_url
    assert_response :success
  end

  test "should get update" do
    get treatments_update_url
    assert_response :success
  end

  test "should get delete" do
    get treatments_delete_url
    assert_response :success
  end

end
