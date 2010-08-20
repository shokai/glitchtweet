# -*- coding: utf-8 -*-
module Doublechar
  def Doublechar.glitch(str)
    result = ''
    str.split(//u).each{|c|
      if c =~ /[ 　\t]/
        result += c
      else
        result += c*2
      end
    }
    result
  end
end
