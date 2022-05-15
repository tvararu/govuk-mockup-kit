require "application_system_test_case"

class JourneysTest < ApplicationSystemTestCase
  setup { @journey = journeys(:one) }

  test "visiting the index" do
    visit journeys_url
    assert_selector "h1", text: "Journeys"
  end

  test "should create journey" do
    visit journeys_url
    click_on "Create a new journey"

    fill_in "Title", with: @journey.title
    click_on "Continue"

    assert_text "Journey was successfully created"
    click_on "Back"
  end

  test "should update Journey" do
    visit journey_url(@journey)
    click_on "Change title", match: :first

    fill_in "Title", with: @journey.title
    click_on "Continue"

    assert_text "Journey was successfully updated"
    click_on "Back"
  end

  test "should destroy Journey" do
    visit journey_url(@journey)
    click_on "Delete this journey", match: :first

    assert_text "Journey was successfully destroyed"
  end
end
