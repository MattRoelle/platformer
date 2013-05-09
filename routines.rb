#gosu drawing routines
require 'gosu'

module Drawing_Routines

  def Drawing_Routines.draw_quad(window, x, y, w, h, color, x_offset=0, y_offset=0)
    window.draw_quad((x+x_offset),(y+y_offset),color,
            (x+x_offset)+w,(y+y_offset),color,
            (x+x_offset),(y+y_offset)+h,color,
            (x+x_offset)+w,(y+y_offset)+h,color)
  end

end

class Numeric

  def to_radians
    return (self*Math::PI)/180
  end

end
