require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get account" do
    get :account
    assert_response :success
  end

end
