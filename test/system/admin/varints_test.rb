require "application_system_test_case"

class Admin::VarintsTest < ApplicationSystemTestCase
  setup do
    @admin_varint = admin_varints(:one)
  end

  test "visiting the index" do
    visit admin_varints_url
    assert_selector "h1", text: "Varints"
  end

  test "should create varint" do
    visit admin_varints_url
    click_on "New varint"

    fill_in "Price", with: @admin_varint.price
    fill_in "Product", with: @admin_varint.product_id
    fill_in "Referance", with: @admin_varint.referance
    fill_in "Size", with: @admin_varint.size
    fill_in "Stockin", with: @admin_varint.stockin
    fill_in "Stockout", with: @admin_varint.stockout
    click_on "Create Varint"

    assert_text "Varint was successfully created"
    click_on "Back"
  end

  test "should update Varint" do
    visit admin_varint_url(@admin_varint)
    click_on "Edit this varint", match: :first

    fill_in "Price", with: @admin_varint.price
    fill_in "Product", with: @admin_varint.product_id
    fill_in "Referance", with: @admin_varint.referance
    fill_in "Size", with: @admin_varint.size
    fill_in "Stockin", with: @admin_varint.stockin
    fill_in "Stockout", with: @admin_varint.stockout
    click_on "Update Varint"

    assert_text "Varint was successfully updated"
    click_on "Back"
  end

  test "should destroy Varint" do
    visit admin_varint_url(@admin_varint)
    accept_confirm { click_on "Destroy this varint", match: :first }

    assert_text "Varint was successfully destroyed"
  end
end
