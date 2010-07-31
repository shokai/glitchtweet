# -*- coding: utf-8 -*-
module Kaibun
  def Kaibun.glitch(str)
    rev = str.split(//u).reverse
    rev.shift
    str + rev.join('')
  end
end
