require 'gosu'
require './routines.rb'
require './rect.rb'
require './tile.rb'
require './player.rb'

class Game_Window < Gosu::Window
  def initialize

    @player = Player.new(100,100)
    @tiles = []
    @tiles << Tile.new(0,568,800,32)
    @tiles << Tile.new(256,400,64,64)

    super 800, 600, false
  end

  def update
    handle_input
    @player.update(@tiles)
  end

  def draw
    @player.render(self)

    @tiles.each do |tile|
      tile.render(self)
    end
  end

  def handle_input
    input = {}
    [Gosu::KbA, Gosu::KbD, Gosu::KbW, Gosu::KbS,Gosu::KbJ, Gosu::KbL, Gosu::KbI, Gosu::KbK].each do |dir|
      if button_down?(dir)
        input[dir] = true
      else
        input[dir] = false
      end
    end
    if input[Gosu::KbD]
      @player.move(1)
    elsif input[Gosu::KbA]
      @player.move(-1)
    end
    if input[Gosu::KbW]
      @player.jump
    end
  end
end

window = Game_Window.new
window.show
