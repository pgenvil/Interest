require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get help--no-test-framework" do
    get :help--no-test-framework
    assert_response :success
  end

end
