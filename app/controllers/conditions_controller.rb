class ConditionsController < ApplicationController
  def index
    @conditions = Condition.last(30).map(&:temperature).join(',')
    @condition = Condition.last
  end
end
