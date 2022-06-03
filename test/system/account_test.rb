require "application_system_test_case"

class AccountTest < ApplicationSystemTestCase
  it "signing in and out works" do
    given_i_am_on_the_start_page
    when_i_click_sign_in
    then_i_am_signed_in_successfully

    when_i_click_the_logo
    then_i_see_the_journeys_page

    when_i_click_sign_out
    then_i_see_the_start_page

    given_omniauth_is_failing
    when_i_click_sign_in
    then_i_see_an_error
  end

  private

  def given_i_am_on_the_start_page
    page.driver.basic_authorize "mockup", "kit"
    visit start_url
  end

  def given_omniauth_is_failing
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    OmniAuth.config.on_failure =
      proc { |env| OmniAuth::FailureEndpoint.new(env).redirect_to_failure }
  end

  def when_i_click_sign_in
    click_on "Sign in with GitHub"
  end

  def when_i_click_sign_out
    click_on "Sign out"
  end

  def when_i_click_the_logo
    click_on "GOV.UK"
  end

  def then_i_am_signed_in_successfully
    assert_text "Signed in successfully"
    assert_text "test@example.com"
  end

  def then_i_see_the_start_page
    assert_text "use without an account"
  end

  def then_i_see_the_journeys_page
    assert_text "Journeys"
  end

  def then_i_see_an_error
    assert_text "Could not sign you in"
  end
end
