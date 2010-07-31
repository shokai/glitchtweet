# -*- coding: utf-8 -*-
module Updown
  def Updown.glitch(str)
    count = 0
    str.split(//u).map{|i|
      if rand > 0.7
        if count % 2 == 0
          i += '↑'
        else
          i += '↓'
        end
        count += 1
      end
      i
    }.join('')
  end
end
