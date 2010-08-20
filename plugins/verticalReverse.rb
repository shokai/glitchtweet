# -*- coding: utf-8 -*-
module Verticalreverse
  def Verticalreverse.glitch(str)
    a = 'abcdefghijklmnopqrstuvwxyz'.split(//u)
    b = 'ɐqɔpǝɟbɥıظʞ1ɯuodbɹsʇnʌʍxʎz'.split(//u)
    str.split(//u).map{|i|
      if a.include?(i)
        i = b[a.index(i)]
      end
      i
    }.join('')
  end
end
