require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  it "#back_link_url" do
    assert_equal back_link_url, "javascript:history.back()"
  end
end
