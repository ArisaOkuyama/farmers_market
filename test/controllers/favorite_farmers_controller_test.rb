require 'test_helper'

class FavoriteFarmersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_farmers_index_url
    assert_response :success
  end

  test "should get create" do
    get favorite_farmers_create_url
    assert_response :success
  end

  test "should get delete" do
    get favorite_farmers_delete_url
    assert_response :success
  end

end
