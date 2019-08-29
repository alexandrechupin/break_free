require 'test_helper'

class IncidentMotivesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get incident_motives_destroy_url
    assert_response :success
  end

end
