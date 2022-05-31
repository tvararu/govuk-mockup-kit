require "application_system_test_case"

class JourneysTest < ApplicationSystemTestCase
  setup do
    Journey.create! title: "Foo"
    Journey.create! title: "Bar"
  end

  test "end to end" do
    given_i_am_on_the_journeys_page
    then_i_see_two_journeys

    when_i_click_create
    then_i_see_the_title_form

    when_i_click_continue
    then_i_see_an_error

    when_i_type_the_title
    and_i_click_continue
    then_i_see_the_journey_page

    when_i_click_edit_title
    then_i_see_the_title_form

    when_i_type_an_empty_title
    and_i_click_continue
    then_i_see_an_error

    when_i_type_the_title
    and_i_click_continue
    then_i_see_the_journey_page

    when_i_click_delete
    then_i_see_the_destroy_message
  end

  def given_i_am_on_the_journeys_page
    visit journeys_url
  end

  def when_i_click_continue
    click_on "Save and continue"
  end
  alias_method :and_i_click_continue, :when_i_click_continue

  def when_i_click_create
    click_on "Create a journey"
  end

  def when_i_click_edit_title
    click_on "Edit title"
  end

  def when_i_type_the_title
    fill_in "What is the name of your journey?", with: "Test journey"
  end

  def when_i_type_an_empty_title
    fill_in "What is the name of your journey?", with: ""
  end

  def when_i_click_delete
    find("details summary").click
    click_on "Delete this journey"
  end

  def then_i_see_an_error
    assert_text "There is a problem"
  end

  def then_i_see_the_journey_page
    assert_text "Journey overview"
  end

  def then_i_see_the_title_form
    assert_text "What is the name of your journey?"
  end

  def then_i_see_two_journeys
    assert_text "Foo"
    assert_text "Bar"
  end

  def then_i_see_the_destroy_message
    assert_text "Journey was successfully destroyed"
  end
end
