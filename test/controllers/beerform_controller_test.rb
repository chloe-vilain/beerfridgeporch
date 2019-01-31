require 'test_helper'

class BeerformControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get beerform_new_url
    assert_response :success
  end

end
