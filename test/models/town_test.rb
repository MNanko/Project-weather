require 'test_helper'

class TownTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "town validation does geocoding" do
    paris = Town.new
    paris.town = "Paris"
    paris.zipcode = 75000
    assert paris.valid?
    assert_equal(paris.lat, 48.8566101)
    assert_equal(paris.lon, 2.3514992)
  end
  
  test "town does not exist" do
    unknown = Town.new
    unknown.town = "MyString"
    unknown.zipcode = 00000
    assert !unknown.valid?
  end
end
