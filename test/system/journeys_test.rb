require "application_system_test_case"

class JourneysTest < ApplicationSystemTestCase
  setup { @journey = journeys(:one) }

  test "visiting the index" do
    visit journeys_url
    assert_selector "h1", text: "GOV.UK Mockup Kit"
  end

  test "should create journey" do
    visit journeys_url
    click_on "Create a journey"

    fill_in "What is the name of your journey?", with: @journey.title
    click_on "Save and continue"

    assert_text "Journey was successfully created"
    click_on "Back"
  end

  test "should update Journey" do
    visit journey_url(@journey)
    click_on "Edit title", match: :first

    fill_in "What is the name of your journey?", with: @journey.title
    click_on "Save and continue"

    assert_text "Journey was successfully updated"
    click_on "Back"
  end

  test "should destroy Journey" do
    visit journey_url(@journey)
    find(".govuk-details__summary-text", text: "Danger zone ⚠️").click
    click_on "Delete this journey", match: :first

    assert_text "Journey was successfully destroyed"
  end
end
