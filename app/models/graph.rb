require 'rubygems'
require 'gruff'

class Graph
  def initialize(temperatures)
    @temperatures = temperatures
    @g = Gruff::Line.new
  end

  def save
    @g.title = "My Graph"
    @g.data("Temperature", @temperatures)
    @g.write('#{Rails.root}/app/assets/images/my_graph.png')
  end

end

