require 'test_helper'

class Admin::ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_image = admin_images(:one)
  end

  test "should get index" do
    get admin_images_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_image_url
    assert_response :success
  end

  test "should create admin_image" do
    assert_difference('Admin::Image.count') do
      post admin_images_url, params: { admin_image: { image: @admin_image.image } }
    end

    assert_redirected_to admin_image_url(Admin::Image.last)
  end

  test "should show admin_image" do
    get admin_image_url(@admin_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_image_url(@admin_image)
    assert_response :success
  end

  test "should update admin_image" do
    patch admin_image_url(@admin_image), params: { admin_image: { image: @admin_image.image } }
    assert_redirected_to admin_image_url(@admin_image)
  end

  test "should destroy admin_image" do
    assert_difference('Admin::Image.count', -1) do
      delete admin_image_url(@admin_image)
    end

    assert_redirected_to admin_images_url
  end
end
