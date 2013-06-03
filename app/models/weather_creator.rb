require 'net/http'

class WeatherCreator
  attr_reader :city, :country

  def initialize(city, country, num_of_days="", date="")
    @city = city
    @country = country
    @num_of_days = num_of_days
    @date = date
    set_current_condition
    set_weather_forecast_condition
  end

  def temperature
    @current_condition["temp_C"]
  end

  def wind_direction
    @current_condition["winddir16Point"]
  end

  def humidity
    @current_condition["humidity"]
  end

  def time
    @current_condition["observation_time"]
  end

  def save
    Condition.create(temperature: temperature, wind_direction: wind_direction, humidity: humidity, time: time)
  end

  def forecast
    @forecast_condition
  end

  private

  def get_weather
    uri_weather = URI("http://api.worldweatheronline.com/free/v1/weather.ashx?key=y3skjhvvvpfka9ytrdycx9kq&q=#{city},#{country}&format=json&num_of_days=#{@num_of_days}&date=#{@date}")
    json_weather = Net::HTTP.get(uri_weather)
    @weather_full = JSON.parse(json_weather)
  end

  def set_current_condition
    get_weather
    @current_condition = @weather_full["data"]["current_condition"][0]
  end

  def set_weather_forecast_condition
    get_weather
    @forecast_condition = @weather_full["data"]["weather"]
  end
end