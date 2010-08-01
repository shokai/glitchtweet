# -*- coding: utf-8 -*-
module Insertwave
  def Insertwave.glitch(str)
    str.split(//u).map{|i|
      if !(i =~ / 　\t/) and rand > 0.8
        i += '〜'
      end
      i
    }.join('')
  end
end
