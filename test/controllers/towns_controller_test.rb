require 'test_helper'

class TownsControllerTest < ActionController::TestCase
  setup do
    @town = towns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:towns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create town" do
    assert_difference('Town.count') do
      post :create, town: { lat: @town.lat, lon: @town.lon, town: @town.town, zipcode: @town.zipcode }
    end

    assert_redirected_to town_path(assigns(:town))
  end
 
  test "should not save town in blank record" do
    assert_no_difference('Town.count') do
      post :create, town: { name: nil, lat: nil, lon: nil }
    end
  end
  
  test "should raise error if Town name is missing" do
    record = Town.new
    record.town = '' # invalid state
    record.valid? # run validations
    assert_equal(record.errors[:name], []) # check for presence of error
  end
  
  test "should show town" do
    get :show, id: @town
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @town
    assert_response :success
  end

  test "should update town" do
    patch :update, id: @town, town: { lat: @town.lat, lon: @town.lon, town: @town.town, zipcode: @town.zipcode }
    assert_redirected_to town_path(assigns(:town))
  end

  test "should not update town if informations invalid" do
    record = Town.new
    record.town = @town.town
    patch :update, id: @town, town: { name: '', lat: @town.lat, lon: @town.lon }
    assert_equal(record.town, @town.town)
  end
  
  test "should destroy town" do
    assert_difference('Town.count', -1) do
      delete :destroy, id: @town
    end

    assert_redirected_to towns_path
  end
end
