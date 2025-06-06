require "test_helper"

class Admin::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_order_detail = admin_order_details(:one)
  end

  test "should get index" do
    get admin_order_details_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_order_detail_url
    assert_response :success
  end

  test "should create admin_order_detail" do
    assert_difference("Admin::OrderDetail.count") do
      post admin_order_details_url, params: { admin_order_detail: { order_id: @admin_order_detail.order_id, price: @admin_order_detail.price, qauntity: @admin_order_detail.qauntity, varain_detail_id: @admin_order_detail.varain_detail_id } }
    end

    assert_redirected_to admin_order_detail_url(Admin::OrderDetail.last)
  end

  test "should show admin_order_detail" do
    get admin_order_detail_url(@admin_order_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_order_detail_url(@admin_order_detail)
    assert_response :success
  end

  test "should update admin_order_detail" do
    patch admin_order_detail_url(@admin_order_detail), params: { admin_order_detail: { order_id: @admin_order_detail.order_id, price: @admin_order_detail.price, qauntity: @admin_order_detail.qauntity, varain_detail_id: @admin_order_detail.varain_detail_id } }
    assert_redirected_to admin_order_detail_url(@admin_order_detail)
  end

  test "should destroy admin_order_detail" do
    assert_difference("Admin::OrderDetail.count", -1) do
      delete admin_order_detail_url(@admin_order_detail)
    end

    assert_redirected_to admin_order_details_url
  end
end
