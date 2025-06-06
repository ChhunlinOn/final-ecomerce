require "application_system_test_case"

class Admin::OrderDetailsTest < ApplicationSystemTestCase
  setup do
    @admin_order_detail = admin_order_details(:one)
  end

  test "visiting the index" do
    visit admin_order_details_url
    assert_selector "h1", text: "Order details"
  end

  test "should create order detail" do
    visit admin_order_details_url
    click_on "New order detail"

    fill_in "Order", with: @admin_order_detail.order_id
    fill_in "Price", with: @admin_order_detail.price
    fill_in "Qauntity", with: @admin_order_detail.qauntity
    fill_in "Varain detail", with: @admin_order_detail.varain_detail_id
    click_on "Create Order detail"

    assert_text "Order detail was successfully created"
    click_on "Back"
  end

  test "should update Order detail" do
    visit admin_order_detail_url(@admin_order_detail)
    click_on "Edit this order detail", match: :first

    fill_in "Order", with: @admin_order_detail.order_id
    fill_in "Price", with: @admin_order_detail.price
    fill_in "Qauntity", with: @admin_order_detail.qauntity
    fill_in "Varain detail", with: @admin_order_detail.varain_detail_id
    click_on "Update Order detail"

    assert_text "Order detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Order detail" do
    visit admin_order_detail_url(@admin_order_detail)
    accept_confirm { click_on "Destroy this order detail", match: :first }

    assert_text "Order detail was successfully destroyed"
  end
end
