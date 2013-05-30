class ForecastsController < ApplicationController
  def show
    @forecast = WeatherCreator.new('donetsk','ukraine',params[:num_of_days], params[:date]).forecast
    render 'show', layout: false
  end
end
