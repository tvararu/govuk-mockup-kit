require "rails_helper"

RSpec.describe ApplicationHelper do
  it "#back_link_url" do
    assert_equal back_link_url, "javascript:history.back()"
  end
end
