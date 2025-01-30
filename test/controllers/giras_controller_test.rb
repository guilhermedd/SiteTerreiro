require "test_helper"

class GirasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gira = giras(:one)
  end

  test "should get index" do
    get giras_url
    assert_response :success
  end

  test "should get new" do
    get new_gira_url
    assert_response :success
  end

  test "should create gira" do
    assert_difference("Gira.count") do
      post giras_url, params: { gira: { event_date: @gira.event_date, name: @gira.name, type_of_gira: @gira.type_of_gira } }
    end

    assert_redirected_to gira_url(Gira.last)
  end

  test "should show gira" do
    get gira_url(@gira)
    assert_response :success
  end

  test "should get edit" do
    get edit_gira_url(@gira)
    assert_response :success
  end

  test "should update gira" do
    patch gira_url(@gira), params: { gira: { event_date: @gira.event_date, name: @gira.name, type_of_gira: @gira.type_of_gira } }
    assert_redirected_to gira_url(@gira)
  end

  test "should destroy gira" do
    assert_difference("Gira.count", -1) do
      delete gira_url(@gira)
    end

    assert_redirected_to giras_url
  end
end
