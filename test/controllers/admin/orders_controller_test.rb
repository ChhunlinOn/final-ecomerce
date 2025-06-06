require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_order = admin_orders(:one)
  end

  test "should get index" do
    get admin_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_order_url
    assert_response :success
  end

  test "should create admin_order" do
    assert_difference("Admin::Order.count") do
      post admin_orders_url, params: { admin_order: { city: @admin_order.city, country: @admin_order.country, email_address: @admin_order.email_address, first_name: @admin_order.first_name, last_name: @admin_order.last_name, mobile_phone: @admin_order.mobile_phone, order_address: @admin_order.order_address, order_email: @admin_order.order_email, order_status: @admin_order.order_status, user_id: @admin_order.user_id } }
    end

    assert_redirected_to admin_order_url(Admin::Order.last)
  end

  test "should show admin_order" do
    get admin_order_url(@admin_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_order_url(@admin_order)
    assert_response :success
  end

  test "should update admin_order" do
    patch admin_order_url(@admin_order), params: { admin_order: { city: @admin_order.city, country: @admin_order.country, email_address: @admin_order.email_address, first_name: @admin_order.first_name, last_name: @admin_order.last_name, mobile_phone: @admin_order.mobile_phone, order_address: @admin_order.order_address, order_email: @admin_order.order_email, order_status: @admin_order.order_status, user_id: @admin_order.user_id } }
    assert_redirected_to admin_order_url(@admin_order)
  end

  test "should destroy admin_order" do
    assert_difference("Admin::Order.count", -1) do
      delete admin_order_url(@admin_order)
    end

    assert_redirected_to admin_orders_url
  end
end
