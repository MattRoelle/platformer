#player

require './rect.rb'
require './routines.rb'

class Player
  
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
    @w = 32
    @h = 32
   
    @dy = 0

    @speed = 4

    @color = 0xFFFFFFFF

    @rect = Rect.new(x, y, @w, @h)
  end

  def update(tiles)

    colliding = false
    correction = nil

    @y += @dy
    @rect = Rect.new(@x, @y, @w, @h)

    tiles.each do |tile|
      if tile.rect.collides?(@rect)
        new_rect = @rect.align_against(tile.rect)

        if @rect.x != new_rect.x
          correction = :x
        else
          correction = :y
        end

        colliding = true

        @rect = new_rect

        @x = @rect.x
        @y = @rect.y
      end
    end

   if !colliding or (colliding and correction == :x)
     @dy += 0.2
     if @dy > 4
       @dy = 4
     end
   elsif colliding
     if correction == :y
       dy = 0
      end
    end

  end

  def move(direction)
    @x += direction*@speed

    @rect = Rect.new(@x, @y, @w, @h)
  end

  def jump
    @dy = -6
  end

  def render(screen)
    Drawing_Routines.draw_quad(screen, @x, @y, @w, @h, @color)
  end

end
