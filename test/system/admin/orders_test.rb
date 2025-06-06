require "application_system_test_case"

class Admin::OrdersTest < ApplicationSystemTestCase
  setup do
    @admin_order = admin_orders(:one)
  end

  test "visiting the index" do
    visit admin_orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit admin_orders_url
    click_on "New order"

    fill_in "City", with: @admin_order.city
    fill_in "Country", with: @admin_order.country
    fill_in "Email address", with: @admin_order.email_address
    fill_in "First name", with: @admin_order.first_name
    fill_in "Last name", with: @admin_order.last_name
    fill_in "Mobile phone", with: @admin_order.mobile_phone
    fill_in "Order address", with: @admin_order.order_address
    fill_in "Order email", with: @admin_order.order_email
    fill_in "Order status", with: @admin_order.order_status
    fill_in "User", with: @admin_order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit admin_order_url(@admin_order)
    click_on "Edit this order", match: :first

    fill_in "City", with: @admin_order.city
    fill_in "Country", with: @admin_order.country
    fill_in "Email address", with: @admin_order.email_address
    fill_in "First name", with: @admin_order.first_name
    fill_in "Last name", with: @admin_order.last_name
    fill_in "Mobile phone", with: @admin_order.mobile_phone
    fill_in "Order address", with: @admin_order.order_address
    fill_in "Order email", with: @admin_order.order_email
    fill_in "Order status", with: @admin_order.order_status
    fill_in "User", with: @admin_order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit admin_order_url(@admin_order)
    accept_confirm { click_on "Destroy this order", match: :first }

    assert_text "Order was successfully destroyed"
  end
end
