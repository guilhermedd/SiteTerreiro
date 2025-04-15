require "application_system_test_case"

class GaleriesTest < ApplicationSystemTestCase
  setup do
    @galery = galeries(:one)
  end

  test "visiting the index" do
    visit galeries_url
    assert_selector "h1", text: "Galeries"
  end

  test "should create galery" do
    visit galeries_url
    click_on "New galery"

    fill_in "Main image", with: @galery.main_image
    fill_in "Name", with: @galery.name
    click_on "Create Galery"

    assert_text "Galery was successfully created"
    click_on "Back"
  end

  test "should update Galery" do
    visit galery_url(@galery)
    click_on "Edit this galery", match: :first

    fill_in "Main image", with: @galery.main_image
    fill_in "Name", with: @galery.name
    click_on "Update Galery"

    assert_text "Galery was successfully updated"
    click_on "Back"
  end

  test "should destroy Galery" do
    visit galery_url(@galery)
    click_on "Destroy this galery", match: :first

    assert_text "Galery was successfully destroyed"
  end
end
