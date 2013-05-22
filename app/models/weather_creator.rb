require 'rubygems'
require 'json'
require 'uri'
require 'net/http'

class WeatherCreator
  attr_reader :city, :country

  def initialize(city, country)
    @city = city
    @country = country
    set_current_condition
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

  private

  def get_weather
    uri_weather = URI("http://api.worldweatheronline.com/free/v1/weather.ashx?key=y3skjhvvvpfka9ytrdycx9kq&q=#{city},#{country}&format=json")
    json_weather = Net::HTTP.get(uri_weather)
    @weather_full = JSON.parse(json_weather)
  end

  def set_current_condition
    get_weather
    @current_condition = @weather_full["data"]["current_condition"][0]
  end
end