#rect class

class Rect
  
  attr_accessor :x, :y, :w, :h
  attr_accessor :left, :top, :right, :bottom

  def initialize(x, y, w, h)
    @x = x
    @y = y
    @w = w
    @h = h

    @left = x
    @right = x + w

    @top = y
    @bottom = y + h
  end

  def collides?(r2)
    if @left > r2.right
      return false
    elsif @right < r2.left
      return false
    elsif @top > r2.bottom
      return false
    elsif @bottom < r2.top
      return false
    else
      return true
    end
  end

  def align_against(r2)
    #aligns self against r2
    x_offset, y_offset = nil

    right_offset = @right - r2.left
    left_offset = @left - r2.right

    top_offset = @top - r2.bottom
    bottom_offset = @bottom - r2.top

    if right_offset.abs < left_offset.abs
      x_offset = right_offset
    else
      x_offset = left_offset
    end

    if top_offset.abs < bottom_offset.abs
      y_offset = top_offset
    else
      y_offset = bottom_offset
    end

    if x_offset.abs <= y_offset.abs
      @x -= x_offset
    else
      @y -= y_offset
    end

    Rect.new(@x,@y,@w,@h)

  end

end
