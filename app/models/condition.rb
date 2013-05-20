class Condition < ActiveRecord::Base
  attr_accessible :temperature, :wind_direction, :humidity, :time
end