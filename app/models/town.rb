class Town < ActiveRecord::Base
  before_validation :geocode
  validates :town, :lat, :lon, presence:true



def forecast
   forecast = ForecastIO.forecast(lat, lon, params: { units: 'si', lang: 'fr' }).currently
  end

  private
  def geocode
    towns =Nominatim.search.city(self.town).limit(1)
    if towns && towns.first
    current_town=towns.first
    self.lat=current_town.lat
    self.lon=current_town.lon
    end
  end
end