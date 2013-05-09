#tile class

require './rect.rb'
require './routines.rb'

class Tile
  
  attr_accessor :x, :y, :w, :h
  attr_accessor :rect
  attr_accessor :color

  def initialize(x, y, w, h, color=0xFFFF0000)
    @x = x
    @y = y
    @w = w
    @h = h

    @color = color

    @rect = Rect.new(x, y, w, h)
  end

  def render(screen)
    Drawing_Routines.draw_quad(screen, @x, @y, @w, @h, @color)
  end

end
