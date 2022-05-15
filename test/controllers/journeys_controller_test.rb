require "test_helper"

class JourneysControllerTest < ActionDispatch::IntegrationTest
  setup { @journey = journeys(:one) }

  test "should get index" do
    get journeys_url
    assert_response :success
  end

  test "should get new" do
    get new_journey_url
    assert_response :success
  end

  test "should create journey" do
    assert_difference("Journey.count") do
      post journeys_url, params: { journey: { title: @journey.title } }
    end

    assert_redirected_to journey_url(Journey.last)
  end

  test "should show journey" do
    get journey_url(@journey)
    assert_response :success
  end

  test "should get edit" do
    get edit_journey_url(@journey)
    assert_response :success
  end

  test "should update journey" do
    patch journey_url(@journey), params: { journey: { title: @journey.title } }
    assert_redirected_to journey_url(@journey)
  end

  test "should destroy journey" do
    assert_difference("Journey.count", -1) { delete journey_url(@journey) }

    assert_redirected_to journeys_url
  end
end
