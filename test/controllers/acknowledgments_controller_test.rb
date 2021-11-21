require "test_helper"

class AcknowledgmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get acknowledgments_index_url
    assert_response :success
  end
end
