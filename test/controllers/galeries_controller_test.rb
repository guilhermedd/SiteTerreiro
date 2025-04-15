require "test_helper"

class GaleriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @galery = galeries(:one)
  end

  test "should get index" do
    get galeries_url
    assert_response :success
  end

  test "should get new" do
    get new_galery_url
    assert_response :success
  end

  test "should create galery" do
    assert_difference("Galery.count") do
      post galeries_url, params: { galery: { main_image: @galery.main_image, name: @galery.name } }
    end

    assert_redirected_to galery_url(Galery.last)
  end

  test "should show galery" do
    get galery_url(@galery)
    assert_response :success
  end

  test "should get edit" do
    get edit_galery_url(@galery)
    assert_response :success
  end

  test "should update galery" do
    patch galery_url(@galery), params: { galery: { main_image: @galery.main_image, name: @galery.name } }
    assert_redirected_to galery_url(@galery)
  end

  test "should destroy galery" do
    assert_difference("Galery.count", -1) do
      delete galery_url(@galery)
    end

    assert_redirected_to galeries_url
  end
end
