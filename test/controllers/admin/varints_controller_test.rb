require "test_helper"

class Admin::VarintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_varint = admin_varints(:one)
  end

  test "should get index" do
    get admin_varints_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_varint_url
    assert_response :success
  end

  test "should create admin_varint" do
    assert_difference("Admin::Varint.count") do
      post admin_varints_url, params: { admin_varint: { price: @admin_varint.price, product_id: @admin_varint.product_id, referance: @admin_varint.referance, size: @admin_varint.size, stockin: @admin_varint.stockin, stockout: @admin_varint.stockout } }
    end

    assert_redirected_to admin_varint_url(Admin::Varint.last)
  end

  test "should show admin_varint" do
    get admin_varint_url(@admin_varint)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_varint_url(@admin_varint)
    assert_response :success
  end

  test "should update admin_varint" do
    patch admin_varint_url(@admin_varint), params: { admin_varint: { price: @admin_varint.price, product_id: @admin_varint.product_id, referance: @admin_varint.referance, size: @admin_varint.size, stockin: @admin_varint.stockin, stockout: @admin_varint.stockout } }
    assert_redirected_to admin_varint_url(@admin_varint)
  end

  test "should destroy admin_varint" do
    assert_difference("Admin::Varint.count", -1) do
      delete admin_varint_url(@admin_varint)
    end

    assert_redirected_to admin_varints_url
  end
end
