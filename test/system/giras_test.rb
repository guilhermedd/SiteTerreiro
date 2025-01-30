require "application_system_test_case"

class GirasTest < ApplicationSystemTestCase
  setup do
    @gira = giras(:one)
  end

  test "visiting the index" do
    visit giras_url
    assert_selector "h1", text: "Giras"
  end

  test "should create gira" do
    visit giras_url
    click_on "New gira"

    fill_in "Event date", with: @gira.event_date
    fill_in "Name", with: @gira.name
    fill_in "Type of gira", with: @gira.type_of_gira
    click_on "Create Gira"

    assert_text "Gira was successfully created"
    click_on "Back"
  end

  test "should update Gira" do
    visit gira_url(@gira)
    click_on "Edit this gira", match: :first

    fill_in "Event date", with: @gira.event_date
    fill_in "Name", with: @gira.name
    fill_in "Type of gira", with: @gira.type_of_gira
    click_on "Update Gira"

    assert_text "Gira was successfully updated"
    click_on "Back"
  end

  test "should destroy Gira" do
    visit gira_url(@gira)
    click_on "Destroy this gira", match: :first

    assert_text "Gira was successfully destroyed"
  end
end
